import json

def lambda_handler(event, context):
    # Print event
    print(json.dumps(event, indent=2))

    # Parse request and user_agent
    request = event['Records'][0]['cf']['request']
    user_agent = request['headers']['user-agent'][0]

    # Determine user OS
    if "Linux" in user_agent['value']:
        print("On a Linux device")
        request['uri'] = "/linux.html"
    elif "Windows" in user_agent['value']:
        print("On a Windows device")
        request['uri'] = "/windows.html"
    elif "Macintosh" in user_agent['value']:
        print("On a Macintosh machine")
        request['uri'] = "/macintosh.html"
    else:
        print("On neither Linux nor Windows nor Macintosh")
        request['uri'] = "/index.html"

    return request
