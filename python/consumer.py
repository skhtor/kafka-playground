from kafka import KafkaConsumer
from json import loads

consumer = KafkaConsumer(
    'Pingers',
     bootstrap_servers=['ip-10-0-1-169.ap-southeast-2.compute.internal:9092'],
     auto_offset_reset='earliest',
     enable_auto_commit=True,
     group_id='my-group',
     value_deserializer=lambda x: loads(x.decode('utf-8')))

for message in consumer:
    message = message.value
    print('Message {}'.format(message))
