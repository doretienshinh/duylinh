const fetch = require('node-fetch');
const TronWeb = require('tronweb');

const FullNode = "https://aicha.acchain.net"

const transaction = (owner_address, privateKey, to_address, amount) => {
  owner_address = TronWeb.address.toHex(owner_address);
  to_address = TronWeb.address.toHex(to_address);
  fetch(`${FullNode}/wallet/createtransaction`, {
      method: 'POST',
      body: JSON.stringify({
        to_address: to_address,
        owner_address: owner_address,
        amount: amount
      })
    })
    .then(res => res.json())
    .then(res => {
      fetch(`${FullNode}/wallet/gettransactionsign`, {
        method: 'POST',
        body: JSON.stringify({
          transaction: res,
          privateKey: privateKey
        })
      }).then(res => res.json())
        .then(res => {
          console.log(res);
          fetch(`${FullNode}/wallet/broadcasttransaction`, {
            method: 'POST',
            body: JSON.stringify(res)
          }).then(res => res.json())
            .then(res => {
              console.log(res);
            });
        });
    });
}

module.exports = {
  transaction: transaction
};