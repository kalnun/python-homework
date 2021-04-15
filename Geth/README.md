# Create a PoA Ethereum Blockchain

## Setup

- All dependencies are in this folder.
- All chain details in **node_details.txt**
- Consensus: Proof of Authority
- Block Time: 15 sec
- Chain ID: 696
- Passwords: **None**

![Network Config](https://github.com/kalnun/python-homework/blob/main/Geth/Screenshots/puppeth_config.png)

## Startup

- Open the *Code* folder, this directory contains all of the necessary files for running the blockchain.

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

### Start Node 1

```
./geth --datadir node1 --unlock "0x49a17572c7247d9Bd9799C363905102ed6050D5a" --mine --rpc --allow-insecure-unlock
```

### Start Node 2
```
./geth --datadir node2 --unlock "0x43b676779CC15b9409dd9E9837a6b2d086a19bbe" --mine --port 30304 --bootnodes "enode://675f9e047a27218c5fdd890eb8477940f0df4634df6521dd02b00af1d28020bfaed6de6d4f37c58450b60d099c9ad865f91bd69a29f4b817cb830c6318459705@127.0.0.1:30303" --ipcdisable --allow-insecure-unlock
```

## Connect to MyCrypto Wallet

### Setup Custom Node

1. Open MyCrypto Wallet
2. Click on *Change Network* in the bottom left
3. Click *Add Custom Node*
4. Change Network to Custom
5. Insert the following Details:
  - Node Name: Node1
  - Network Name: networkname
  - Currency: ETH
  - Chain ID: 696
  - URL: http://127.0.0.1:8545
6. Click Save & Use Custom Node

### Import Wallet
1. Click *View & Send" in top left
2. Click *Keystore File*
3. Click *Select Wallet File*
4. Navigate to *Code/node1/keystore* and click on the file starting with *UTC*
5. Congrats you have opened the wallet on a local ethereum testnet!

### Send Transaction
1. Insert Address (public key) of node2 located in *node_details.txt* under *NODE 2*
2. Enter how much ETH you would like to send.
3. Click *Sign Transaction*
4. Copy and paste the transaction hash into the bottom box in the *TX Status* tab on the middle left.
5. Wait for the transaction to be mined
6. Congrats! You have just sent a transaction on a local testnet!
7. You output should look something like this

![Confirmed Tx](https://github.com/kalnun/python-homework/blob/main/Geth/Screenshots/transaction.png)
