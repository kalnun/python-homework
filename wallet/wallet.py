import json, os, web3
import subprocess
from bit import PrivateKeyTestnet 
from bit.network import NetworkAPI
from web3.eth import Account
from dotenv import load_dotenv
from constants import *

# from web3.auto.gethdev import w3



load_dotenv()

mnemonic = os.getenv('MNEMONIC', "history nice alarm flavor canvas share brass scale clerk board shift main place inhale access silent lend tumble wage bunker pencil own next phrase")

def derive_wallets(mnemonic, coin, numderive):
	command  = f'php ./hd-wallet-derive/hd-wallet-derive.php -g --format=json --coin={coin} --mnemonic={mnemonic} --cols=path,address,privkey,pubkey --numderive={numderive}'
	p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
	output, err = p.communicate()
	p_status = p.wait()

	keys = json.loads(output)
	return keys

def priv_key_to_account(coin, priv_key):
	if coin == 'ETH':
		return Account.privateKeyToAccount(priv_key)
	elif coin == 'BTCTEST':
		return PrivateKeyTestnet(priv_key)
	else:
		print('Coin not supported')
		return None
	
def create_tx(coin, account, to, amount):
	if coin == 'ETH':
		tx_info = {
			'to': to,
			'from': account,
			'value':amount,
			'gas':web3.eth.estimate_gas({
				'to': to,
				'from': account,
				'value': amount
			}),
			'gasPrice': web3.eth.gas_price,
			'nonce': web3.eth.get_transaction_count(web3.eth.coinbase),
			'chainID': 577
		}
		return tx_info
	elif coin == 'BTCTEST':
		return PrivateKeyTestnet.prepare_transaction(account, [(to, amount, BTC)])
	else:
		print('Coin not supported')
		return None	

def sent_tx(coin, account, to, amount):
	raw_tx = create_tx(coin, account, to, amount)
	if coin == 'ETH':
		signed = web3.eth.sign_transaction(raw_tx)
		return web3.eth.sendRawTransaction(signed.rawTransaction)
	elif coin == 'BTCTEST':
		signed = PrivateKeyTestnet.sign_transaction(raw_tx)
		return NetworkAPI.broadcast_tx_testnet(signed)
	else:
		print('Coin not supported')
		return None

print('loading...')

coins = {
	'btc': derive_wallets(mnemonic, BTC, 3),
	'eth': derive_wallets(mnemonic, ETH, 3),
	'btc-test': derive_wallets(mnemonic, BTCTEST, 3)
}
