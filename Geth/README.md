# Create a PoA Ethereum Blockchain

## Setup

- All dependencies are in this folder.
- All chain details in **node_details.txt**
- Chain ID: 696
- Passwords: **None**

## Startup

- The 

### Start Node 1

**Flag Meanings**

- datadir
  - Specify directory of node
- unlock
  - Sealing address this node uses
- mine
  - Tells the node to mine
- rpc
  - Specify type of connection to other nodes
- allow-insecure-unlock
  - Allow insecure connection to unlock node
- port
  - Specify port for node
- bootnodes
  - Specify location of first node so any node can connect to it
- ipcdisable
  - This is windows specific. Disables intermemory communication.

```
./geth --datadir node1 --unlock "0x49a17572c7247d9Bd9799C363905102ed6050D5a" --mine --rpc --allow-insecure-unlock
```

### Start Node 2
```
./geth --datadir node2 --unlock "0x43b676779CC15b9409dd9E9837a6b2d086a19bbe" --mine --port 30304 --bootnodes "enode://675f9e047a27218c5fdd890eb8477940f0df4634df6521dd02b00af1d28020bfaed6de6d4f37c58450b60d099c9ad865f91bd69a29f4b817cb830c6318459705@127.0.0.1:30303" --ipcdisable --allow-insecure-unlock
```
