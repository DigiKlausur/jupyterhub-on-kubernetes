import dbm

with dbm.open('/tmp/example.dbm', 'n') as db:
    db['key'] = 'value'
    db['today'] = 'Sunday'
    db['author'] = 'Doug'
