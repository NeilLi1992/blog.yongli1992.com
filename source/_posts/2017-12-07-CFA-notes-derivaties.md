title: CFA Notes - Derivatives
date: 2017-12-07 21:08:18
tags:
	- cfa
	- finance
categories:
	- finance
---
占比 5%，12 题，一个 study session。

## Categorizations
必考必背：
1. 根据合约特点分类
    1. forward commitment
        1. futures
        2. forward
        3. swap contracts
    2. contingent claim
        1. option
        2. CDS
2. 根据交易场所
    1. exchange-traded
        1. futures
        2. options
    2. OTC traded
        1. forward
        2. swap
---
**Advantages of derivatives
1. price discovery
2. risk management: hedge and speculation
3. lowering transaction costs
4. low capital requirement
5. greater liquidity
6. ease of going short
7. enhance market efficiency

**Disadvantages of derivatives
1. too risky -> high leverage
2. complex instruments

## Risk-free arbitrage and no-arbitrage rule 无套利定价法则
**Law of one price 一价原理**： 让市场上产品的价格不存在被套利空间，two securities with identical cash flow should have the same price.

$FP=S_0\times{}(1+r_f)^T$

Restrict selling or arbitrating will both restrict the price discovery function of the market.

## Forward
Long: buy underlying
Short: sell underlying

注意：No payments will be made at the inception of a forward contract, so both parties of a forward contract is exposed to potential default risk.

Forward is a zero-sum game, long + short = 0.

Settling a forward contract at expiration:
    1. physical settlemnt 实物交割，一手交钱一手交货。
    2. cash settlement 现金交割（补差价），无实物易手。

Settling prior to expiration:
    Entering into an opposite forward contract:
        1. offsetting with a different party 有风险
        2. offsetting with the original party 无风险

## Forward rate agreement (FRA) 远期利率协议
A forward contract for the long to get a loan from the short at a specific future date at a rate fixed in the contract.

Long FRA: borrower，长期 LIBOR 看涨
Short FRA: lender, 长期 LIBOR 看跌

报价形式：
1x4FRA 基于一个月后的 3-month LIBOR。
2x5FRA 基于两个月后的 3-motnh LIBOR.

2 表示：contract expiration date from today.
5 表示：loan end date from today.

实际交割的时候按现金交割，没有贷款真的发生。如果 LIBOR 上涨，long 方赚钱，如果 LIBOR 下跌，short 方赚钱。

## Futures
本质上也是一个 forward，只不过是在 exchange 交易的标准化的 forward。

Futures are priced to have zero value at the time an investor enters into the contract.

在开始合同的时候，是要交 margin 的，由 clearinghouse 担保，没有违约风险。

**futures contract 风险控制三法**
1. Margin
    1. initial margin 初始保证金
    2. maintenance margin 维持保证金，跌破的话就会收到 margin call
    3. variation margin 变动保证金，used to bring the margin balance back up to the initial margin level（权益投资的杠杆交易中只要回到 maintenance margin 即可）。
2. Daily price limit 涨跌停机制
3. Marking to market 逐日盯市制度，每日交割（forward 只在到期日交割）

## Swap
Swap 本质上是一系列的 forward contract，所以它和 forward contract 的属性是很像的。Obligate two parties to change a series of cash flows on periodic settlement dates over a certain time period.

CFA 一级唯一的考点：**Interest Rate Swaps 利率互换**
Trading fixed interest rate payments for floating-rate payment.

Pay-fixed side: The counterparty that wants variable-rate interest, adn agree to apy fixed-rate interest.
Pay-floating side: The counterparty that receives the fixed payment and agrees to pay variable-rate interest.

## Options
买卖 option 权利本身用 long and short。
对 underlying asset 的看涨看跌用 call and put。

Short position in an option is referred to as the writer of the option.

Option premium: paid by the long position.

### Moneyness 价值状态
1. In the money: long 方立即行权可以赚钱。
2. At the money: long 方立即行权不能赚钱，almost generate payoff.
3. Out of the money: long 方立即行权还不能赚钱。

### Intrinsic value & Time value
The amount that's in the money, otherwise zero.
也就是立即行权能够赚到的钱，不能赚钱就是 0.

牢记四张头寸图：
 ![](https://i.imgur.com/l3owMX8.png)
1. long call: 收益无限，损失有限
2. long put：收益有限，损失有限
3. short call：收益有限，损失无限
4. short put：收益有限，损失有限

对于 long call, intrinsic value = max(0, S-X)
对于 lnog put, intrinsic value = max(0, X-S)

如果题目问的是 gain/loss，除了考虑 intrinsic value，还要考虑 option premium 期权费。
如果问的是 payoff 的话不用考虑期权费。
如果问的是 profit 的话，要扣减期权费。

**Time Value**
必背：
Option value = intrinsic value + time value

Volatility 越大, time value 越大，期权越值钱。
时间越长，time value 越大，期权越值钱。

If the option is deeply out of money or deeply in the money, time value is negligible.
Time value is maximized when option is at the money.

到期日值钱，option value > intrinsic value.
到期日，option value = intrinsic value.

**Option 分类**
1. American Option 美式期权：
    期间任意时间可以行权，更加 flexible，赚钱机会更大，美式期权价值 > 欧式期权价值
    
2. European Option 欧式期权：
    只能在到期期限的时刻行权
    
**Minimum and maximum option values**
必背表格：
 ![](https://i.imgur.com/T1iZenT.png)


## Put call parity 买卖权平价公式
$p+S=c+\frac{X}{(1+R_f)^T}$

左边叫 protective put.
右边叫 fiduciary call.

可以用来为 option 定价，或者合成 option。
在无风险套利中，如果两侧出现价差，long 小边，short 大边。

## Forward Pricing and valuation
### Pricing
Pricing is the process of determining the no-arbitrage price that will make the value of the contract be zero to both sides at the initiation of the contract.

$\text{FP}=S_0+PV(\text{opportunity cost}+\text{carrying cost}-\text{carrying benefit})$.

where: $S_0$ is current stock price.

简化公式：
$FP=S_0\times{}(1+r_f)^T$
因为有的产品没有 carrying cost，有的没有 carrying benefit，但是 opportunity cost 是一定有的。

### Valuation
Valuation means determining the value of the contract at some time during the life of the contract.

$V=S_t-\frac{FP}{(1+r_f)^{T-t}}$

**T-bill forwards 零息债券的远期合同**
$FP=S_0\times{}(1+R_f)^T$

**Forwards on a dividend-paying stock 付息债券的远期**
1. Pricing:
    $FP=(S-0-PVD_0)\times{}(1+r_f)^T$
    
2. Valuation:
    $V_{long}=S_t-PVD_t-\frac{FP}{(1+r_f)^{T-t}}$

**Carrying costs**
    持有成本，金融产品一般没有 carrying cost，commodity 可能有。

**Carrying benefits**
1. dividends, coupons, interest 货币形式的收益
2. convenience yield 持有便利

## Futures pricing and valuation
Futures 不需要 valuation，因为有逐日盯市制度。

必背结论：
1. 如果 market rate 和 underlying asset 是 positive correlaiton, prefer to go long in a future contract.
2. 如果 market rate 和 underlying asset 是 negative correlation, prefer to go long in a forward contract.
3. 如果是 zero correlation，no preference。

## Swap pricing and valuation
考试掌握：

$V_{\text{swap}}=PV_{\text{receipt}}-PV_{\text{paid}}$

interest rate swap 等价于发行了一个 floating bond，购买了一个 fixed bond（pay-floating side）.

## Option pricing and valuation
考试会给定一个 factor，问对 value 的影响是正相关还是负相关。

## Option Strategies
### Covered call
Covered call is: -C+S, long a stock, short a call.
![](https://i.imgur.com/LZez9rY.png)
Maximum loss: $-S_0+C_0$
Maximum gain: $C_0+S_t-S_0-(S_t-X)=C_0+X-S_0$
Break-even point: $S_0-C_0$

### Protective put
Protective put is: P+S, long a stock, long a put.
![](https://i.imgur.com/yoYZjbF.png)

Maximum loss: $X-(P_0+S_0)$
Maximum gain: $\infty$
Breka-even point: $S_0+P_0$





















