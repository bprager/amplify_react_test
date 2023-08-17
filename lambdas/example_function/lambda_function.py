import boto3
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ['DYNAMODB_TABLE_NAME']
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    # Example code to put an item into the DynamoDB table
    response = table.put_item(
       Item={
            'id': '123',
            'data': 'sample data'
        }
    )
    
    return {
        'statusCode': 200,
        'body': response
    }

