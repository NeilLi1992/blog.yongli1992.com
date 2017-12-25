title: CFA Notes - Portfolio Managements
date: 2017-12-07 21:10:37
tags:
	- cfa
	- finance
categories:
	- finance
---
Portfolio Risk and Return 的计算比较重要，别的都不重要。

## Pooled investments
1. Index mutual fund
    Buy shares directly from the fund.
    股利是再投资，不支付给投资者的。
2. ETF
    Buy or sell shares from other investors.
    股利是支付的。
    The minimum required investment in an ETF is usually smaller.
    Having tax advantages over index mutual fund.
    
## Risk Management
** Risk exposure 风险敞口**
The extent to which an entity's value may be affected through sensitivity to underlying risks.

Risk management is **not about minimizing risks**. It aims to achieve organizational or personal objectives while **bearing a tolerable level of risk**.

### Value at Risk (VaR)
是风险的一种度量，5% VaR of $1 million, 表示有 5% 的概率在一天内损失 1 million。The VaR measure indicates the probability of a loss at a certain level in a time period.

### Types of risks
1. Market risk 市场风险
    1. movements in stock prices
    2. interest rates
    3. exchange rates
    4. commodity rates
2. Credit risk (counterparty risk) 对手方风险。只有赚钱的一方有 counterparty risk，亏钱的一方没有。
3. Liquidity risk 流动性风险
    1. lack of market participants
    2. degradation in market conditions
    3. can also be called transaction cost risk, and is most associated with a **widening bid-ask spread**.

Above are financial risks.

Other non-financial risks: settlement risk, operational risk, legal risk, regulatory risk, accounting risk, tax risk, model risk, tail risk, sovereign/political risk.

**Interaction between risks**
Risks are not independent, many risks arise as a result of other risks. Risk interactions can be extremely non-linear and harmful.

**Risks drivers**
Risk drivers are the fundamental global and domestic **macroeconomic** and **industry factors**.

## Expected return and expected standard deviation
### For individual investmetn
1. Expected return
    $E(R)=\sum^n_{i=1}P_iR_i$
    
2. Variance of return
    $\sigma^2=\sum^n_{i=1}P_i[R_i-E(R)]^2$
    
3. Standard deviation of return
    $\sigma=\sqrt{\sum^n_{i=1}P_i[R_i-E(R)]^2}$
    
### For a portfolio
1. Expected return
    按权重求期望
    $E(R)=\sigma^n_{i=1}w_iR_i$
    
2. Variance
    每个组分的 variance 都要单独求出来，然后乘以权重的平方，再加上后面的 covariance 部分。
    $\sigma^2=\sum^n_{i=1}w_i^2\sigma_i^2+\sum^n_{i=1}\sum^n_{j=1}w_{i}w_{j}Cov_{i,j}$

    如果题中说每个组分 equal weights，并且给定 average variance/covariance，有简化公式：
    $\sigma^2=\frac{\overline{\sigma^2}}{N}+\frac{N-1}{N}\overline{Cov}$
    
    For a portfolio of two risky assets:
    $\sigma^2=w_1^2\sigma_1^2+w_2^2\sigma_2^2+2w_1w_2\sigma_1\sigma_2\rho_{1,2}$

3. Standard deviation
    $\sigma=\sqrt{\sum^n_{i=1}w_i^2\sigma_i^2+\sum^n_{i=1}\sum^n_{j=1}w_{i}w_{j}Cov_{i,j}}$

4. Covaraince 有两种求法
    1. Use expectation data
        $Cov_{1,2}=\sum^n_{i=1}P_i[R_{i,1}-E(R_1)][R_{i,2}-E(R_2)]$
    2. Use historical data
        $Cov_{1,2}=\frac{1}{n-1}\sum^n_{i=1}[R_{i,1}-\overline{R_1}][R_{i,2}-\overline{R_2}]$

5. Correlation
    $\rho_{1,2}=\frac{Cov_{1,2}}{\sigma_1\sigma_2}$

## Markowitz Theories
### Assumptions
1. Returns distribution: 每个投资的期望回报都可以在一定 horizon 内用一个概率分布来 measure
2. Utility maximization: 投资者长期希望最大化 utility
3. Risk is variablity: risk is measured in terms of variance of expected returns
4. Risk/return: investors make their decision based on expected returns and risk
5. Risk aversion: 假设所有人都是风险厌恶型的。

 ![](https://i.imgur.com/HlKFLqT.png)
### Minimum-variance frontier
图上包含了所有的 risky portfolio。
对于每一个给定的 E(R)，具有最小 variance 的 portfolio 构成的线成为 minimum-variance frontier. 其中最左侧的那个称为 global minimum-variance portfolio.

### Efficient frontier
对于每一个给定的 variance，具有最大 E(R) 的 portfolio 构成的线成为 efficient frontier 有效前沿。

1. 在风险一定时，有效前沿上的点具有最大的收益。
2. 在收益一定时，有限前沿上的店具有最小的风险。

### Indifference curve
 ![](https://i.imgur.com/Rv28rXY.png)
对于不同的投资者，各有不同的无差异曲线，在同一条无差异曲线上他的投资没有区别。

## Capital market theory
### Two-fund separation theorem
1. Combining a risky portfolio with a risk-free asset
2. All investors' optimum portfolios will be made up of some combinations of an optimal portfolio of risky assets and the risk-free asset.

![](https://i.imgur.com/zJfFWjL.png)
给定一个 risk-free rate $r_f$ 作为纵轴交点，再给定一个 portfolio 的 risk 和 return，连线就是所有 possible risk and return combinations，即成为 capital market line。

当特殊情况下，这个 portfolio 使用 market portfolio，这条连线就成为 capital market line。

真正构建出 capital market line，是需要在给定 risk-free rate 的纵轴截点的前提下，画出一条与有效前沿的切线，切点就是 market portfolio。

Market portfolio consists of every risky assets. The weights of each asset are equal to the percentage of the market value to hte entire market portfolio.

**CML 公式**
$E(R_p)=R_F+\frac{E(R_M)-R_F}{\sigma_M}\sigma_P$

重点：
在  CML 线上，如果要获得比市场组合更高的收益，需要使用 leverage, and borrow at hte risk-free rate.

## SML
**Systematic risk**
Can't be eliminated by diversification, measured by beta.

**Unsystematic risk**
Can be eliminated by diversification.

Since unsystematic risk can be eliminated by diversification, only systematic risk is compensated, unsystematic risk is not compensated.

### Beta
A standardized measure of systematic risk.
$\beta_i=\frac{Cov_{i, mkt}}{\sigma_{mkt}^2}=(\frac{\sigma_i}{\sigma_{mkt}})\times{}\rho_{i,mkt}$

### SML
A graphical representation of CAPM with beta, reflecting systematic risk on x-axis, and expected return on y-axis.

1. undervalued
    出现在线的上方
    estimated return > required return from SML, price undervalued, should buy
    
2. overvalued
    出现在线的下方
    estimated return < required return from SML, price overvalued, should sell
    
3. properly valued
    出现在线上
    investors should hold (indifferent between buy/sell).









