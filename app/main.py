import json


def handler(event, context):
    try:
        number = event["queryStringParameters"]["number"]
    except KeyError:
        return {
            "statusCode": 400,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "warning": "You have to provide a number!"
            })
        }

    try:
        power = event["queryStringParameters"]["power"]
    except KeyError:
        return {
            "statusCode": 400,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "warning": "You have to provide a power!"
            })
        }

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "result": number ** power
        })
    }
