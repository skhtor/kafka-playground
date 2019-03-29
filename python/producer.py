from time import sleep
from json import dumps
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers=['ip-10-0-1-169.ap-southeast-2.compute.internal:9092'],
                         value_serializer=lambda x:
                         dumps(x).encode('utf-8'))

for e in range(1000):
    data = {'number' : e}
    producer.send('Pingers', value=data)
    sleep(5)
