# exercise20_solidity

<h2>Depedencies</h2>
<p>1 Ganache </br>
   2 Metamask </br>
   3 Remix + Metamask sync (in same browser)</br>
</p>

<h2>AssociateProfitSplitter</h2>
<p>This contract will equally split the amount to be paid among three employees. </br>
   This contract will then distribute and transfer these amounts to the employees. </br>
</p>

<h2>TierredProfitSplitter.sol</h2>
<p>This contract simulates profits of a company that are split between three employees.</br>
   The remaining profits will be calculated an distributed to the CEO. </br>
</p>

<h2>DeferredEquityPlan.sol</h2>
<p>This contract simulates a Deferred Equity Plan for an employee. </br>
   A total of 1000 shares will be distributed to an employee over the course of 4 years. </br>
   This contract makes use of a fakenow variable to simulate a time elapse for testing purposes </br>
   To use the fakenow, after deploying the contract, the tester should call fastforward() before distribute(). </br>
</p>
