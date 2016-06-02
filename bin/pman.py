#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from hashlib import sha256
from os.path import expanduser
import sqlite3
from sys import argv, stdout

CONFIG_ROOT = expanduser('~/.config/pman/')
KEYFILE = CONFIG_ROOT + 'pman.key'
DBFILE = CONFIG_ROOT + 'database.db'

DEFAULT_ALPHABET = ('abcdefghijklmnopqrstuvxyz'
                    'ABCDEFGHIJKLMNOPQRSTUVXYZ'
                    '0123456789!#%&*()-_')


with open(KEYFILE, 'r') as keyf:
    secret_key = keyf.readlines()[0].strip()

conn = sqlite3.connect(DBFILE)
cur = conn.cursor()
cur.execute("CREATE TABLE IF NOT EXISTS pman_password(service TEXT UNIQUE NOT NULL, length INT DEFAULT 10, alphabet TEXT)")

def get_plaintext():
    import getpass
    plaintext = getpass.getpass()
    return plaintext

def db_list():
    cur.execute("SELECT service FROM pman_password")
    while True:
        row = cur.fetchone()
        if not row:
            break
        yield row[0]

def db_get(service):
    cur.execute("SELECT * FROM pman_password WHERE service='" + service + "'")
    line = cur.fetchone()
    if line:
        return {'service': line[0], 'length': line[1], 'alphabet': line[2]}
    else:
        return None

def db_save(service, length, alphabet):
    cur.execute("INSERT INTO pman_password VALUES('{}', {}, '{}')".format(service, length, alphabet))
    conn.commit()

def db_delete(service):
    cur.execute("DELETE FROM pman_password WHERE service='{}'".format(service))
    conn.commit()


def generate_password(plaintext, service, length, alphabet):
    salt = sha256((secret_key+service).encode('utf-8')).hexdigest()[:20]
    hsh = sha256((salt+plaintext).encode('utf-8')).hexdigest()

    raw_hexdigest = ''.join((salt, hsh))

    num_chars = len(alphabet)
    num = int(raw_hexdigest, 16)

    chars = []
    while len(chars) < length:
        num, idx = divmod(num, num_chars)
        chars.append(alphabet[idx])

    return ''.join(chars)


def cmd_help():
    print('usage:')
    print('{}'.format(argv[0]))
    print('{} help'.format(argv[0]))
    print('  Display help')
    print('{} list'.format(argv[0]))
    print('  List stored services')
    print('{} <service> [<length>] [<alphabet>]'.format(argv[0]))
    print('  Generate a password for SERVICE of length LENGTH using the letters of ALPHABET')
    print('{} del <service>'.format(argv[0]))
    print('  Remote SERVICE from storage')
    
def cmd_list(auto=False):
    if auto:
        print(' '.join(db_list()))
    else:
        print('\n'.join(db_list()))

def cmd_del(service):
    db_delete(service)

def cmd_get(service, length=10, alphabet=None):
    args = db_get(service)
    if not args:
        args = {
                'service': service,
                'length': int(length),
                'alphabet': alphabet or DEFAULT_ALPHABET,
                }
        db_save(**args)
    plaintext = get_plaintext()
    return generate_password(plaintext, **args)


if __name__ == "__main__":
    if len(argv) <= 1:
        cmd_help()
    else:
        cmd = argv[1]
        if cmd == 'help':
            cmd_help()
        elif cmd == 'list':
            cmd_list(*argv[2:])
        elif cmd == 'del':
            cmd_del(*argv[2:])
        else:
            pwd = cmd_get(*argv[1:])
            print(pwd, end='')

