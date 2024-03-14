
import requests
import json
import pandas as pd
import mysql.connector as mysql

all_states_data = []
df_state=pd.DataFrame()
result_df=pd.DataFrame()

def county_stats() : 
    api_key = ''
    api_url = "https://api.census.gov/data/2021/acs/acs5"

    #state_code = '01'  # Replace with the desired state code
    all_states_data = []
    df_state=pd.DataFrame()
    result_df=pd.DataFrame()
    flag=0
    for state_code in range(1, 60):
        state_code_str = f'{state_code:02d}'  # Format state code as a two-digit string


        params = {
            'get': "NAME,B01001_001E,B01001_002E,B19013_001E,B19301_001E,B17001_001E,B02001_001E,B02001_002E",
            'for': 'county:*',
            'in': f'state:{state_code_str}',
            'key': api_key
        }

        response = requests.get(api_url, params=params)

        if response.status_code == 200:
            data = response.json()
            columns = data[0]
            df = pd.DataFrame(data[1:], columns=columns)
            #result_df=df.append(df,result_df,ignore_index=True)
            result_df=pd.concat([result_df,df], ignore_index=True)
        else:
            print(f"Error: {response.status_code}, {response.text}")

        #print(data[0])
    output_file = 'census_population_data.xlsx'
    print(result_df.shape)
    result_df.to_excel(output_file, index=False)

def db_connection():
    county_stats
    db = mysql.connect(host = "127.0.0.1",
                   user = "root",
                   passwd = "pwd",
                   database = "census"
                )

    cursor = db.cursor()
    selected_columns=result_df.columns
    tuple_list = result_df[selected_columns].values.tolist()
    insert_query="INSERT INTO county_mertics(B01001_001E,B01001_002E,B19013_001E,B19301_001E,B17001_001E,B02001_001E,B02001_002E,state,county,county_name,country_name) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    cursor.executemany(insert_query, tuple_list)
    db.commit()

db_connection


