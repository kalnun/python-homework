# This repo contains solidity code for automated accounting.

## Tiered Profit Splitter

### Motivation

- Write a contract that takes 3 employee addresses at creation and pays each employee an equal proportion of the ether sent to the contract. The remainder is sent to HR.

### Functions

- **balance()**
  - Return the current balance of the contract.
- **deposit()**
  - Splits the amount of ether sent to the contract into three equal proportions and sends the proportions to the three predefined addresses. The remaining ether is sent to HR.

### Contract in Action

> ![Tiered Profit Splitter GIF](https://github.com/kalnun/python-homework/blob/main/Solidity/gifs/Deployed_TieredProfitSplitter.gif)

## Associate Profit Splitter

### Motivation

- Write a contract that takes in 3 employee addresses at creation and pays each employee a proportion of the ether sent to the contract based on their status in the company.

### Functions

- **balance()**
  - Return the current balance of the contract.
- **deposit()**
  - Splits the amount of ether sent to the contract into three proportions (60%/25%/15%)  and sends the proportions to three addresses (ceo/cto/bob) and send the remainder back to the ceo.

### Contract in Action

> ![Associate Profit Splitter GIF](https://github.com/kalnun/python-homework/blob/main/Solidity/gifs/Deploy_AssociateProfitSplitter.gif)

## Deferred Equity Plan

### Motivation

- Write a contract that takes in an employees address and sets up an annual equity dispursement that is 4 years long. 1000 shares will be redeemable over 4 years in 250 share increments.

### Functions

- **distribute()**
  - Distributes 250 shares annually for 4 years not exceeding 1000 shares in total. After disbursement the contract is locked for another year from the day of disbursement.
- **fastforward()**
  - Advance the time of the contract 100 days into the future. This is to test the time constraints of the share disbursement schedule.
- **deactivate()**
  - Render the contract invalid.

### Contract in Action

> ![Deferred Equity Plan GIF](https://github.com/kalnun/python-homework/blob/main/Solidity/gifs/Deploy_DefferedEquityPlan.gif)
