Welcome to the Quant Network

You must have the geth toolkit copied into this directory before use.

To start the network you first run:
geth --datadir node1 --mine --minerthreads 1

And then:
geth --datadir node2 --port 30304 --rpc --bootnodes "enode://0a19d7930c9733fdcec00fbad5c2bf0267522ac01c968f8665cf15528e12967929dafec451f119cee3d6c1bd9d6430e1af8e022ccc316cc439008a1b9d2554a6@127.0.0.1:30303" --ipcdisable --mine --minerthreads 1

This should start the network and you will be able to push smart contracts and send transactions.

Network Specs:
  Consensus Algo : Proof of Authority
  Chain Code     : 777
  Account One    : 5760e575F66172b7f5a4DEc9f1dA6BD54A81E16F
  Account Two    : eb03618663C310A0484E6b338E8Cf133Ee872924
  Ports          : (30303, 30304)
