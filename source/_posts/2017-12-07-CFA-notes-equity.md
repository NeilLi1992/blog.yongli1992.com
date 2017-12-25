title: CFA Notes - Equity
date: 2017-12-07 21:06:23
tags:
	- cfa
	- finance
categories:
	- finance
---
占比 10%，上下午一共 24 题，计算题很少，以概念题为主。

# Functions of the financial markets
1. fulfill different entities' requirements 满足不同市场参与者的要求
2. detemrine interest rate 决定市场均衡利率是多少
3. allocate capital to its most efficient uses

---
**Call markets & continuous markets**
* Call markets 集合竞价市场
    Stock is only traded at specific times. Then a negotiated price is est that clears the market for the stock. This method is used in smaller markets and to set opening prices and prices after trading halts on major exchanges.
* Continuous markets 连续竞价市场
    Trades occur at any time the market is open. The price is set by either the auction process or by dealer bid-ask quotes.
    
**Quote-driven, order-driven and brokered markets**
1. Quote-driven Market 报价驱动型市场，又叫 dealer market
    Traders transact with dealers who post bid and ask prices.  市场价格收 dealer 报价影响，dealer 赚的是 bid-ask spread.
    例如：bond market, currency market, spot commodity.
    
2. Order-driven market 订单驱动型市场
    例如：股票市场
    报价方法：
        1. 价格优先
        2. 时间优先（价格一样，先来先成交）

3. Brokered market 中介市场
    一般交易特殊/流动性差/大宗的交易。
    Brokers find the counterparty in order to execute a trade.
    例如：房地产市场，艺术品市场。
    
**Short position in transaciton**
Short 借来的股票的分红是要给 lender 的。
借来的 stock 卖掉后得到的先进不能取出来，必须存留在 broker 账户中，以防止违约。

除了现金的存留，券商还要收取额外的 margin，防止股票价格上升的时候做空者违约不付上涨的差价。

存在券商处的 proceeds & margin，券商可以拿去做短期投资，此时获得的收益是属于 short seller 的，但券商会扣除服务费再给 short seller，这笔利息费用叫做 **short rebate rate**.

If security is difficult to borrow, short rebate rate may be lower or negative.

## Leveraged position
$\text{margin}=\frac{\text{equity}}{\text{Asset}}$ 自有资金占比
$\text{leverage}=\frac{\text{asset}}{\text{equity}}=\frac{1}{\text{margin}}$ 杠杆比率 

自由资金占比越高，杠杆比率越低越安全。

Eqtuiy trading 中，接到 margin call 只要交回 maintenance margin 即可。

必考公式：
Margin call trigger price:
$P=P_0\times{}\frac{1-\text{initial margin}}{1-\text{maintenance margin}}$

## Transcation instructions
### Execution instructions 执行指令
1. Market order
    市价指令，保证成交，不保证最优价格
    
2. Limit Orders 限价指令
    只有在满足规定的条件下才成交，不保证成家，但保证理想价格
    
    1. make the market 按盘口最好价下单，提供流动性
    2. make a new market 成为新的盘口最好价
        对于 buyer，higer than bid 1
        对于 seller, lower than ask 1
    3. behind market 不是盘口最好价
    4. far from the market 离盘口价差的非常远
    5. marketable order 最好的价格，可以直接成交，比如 buyer 的出价已经高过 ask 1，是更加 aggressive 的下单方法。

3. All-or-nothing orders: 要么全部成交，要么全部不成交

4. Hidden orders: only the broker or exchange knows the trade size. 下的单子市场上其他投资者不可见。撮合的时候只满足价格优先，不满足时间优先，同一价格时会先成交 hidden orders。

5. Icerberg orders: 类似 hidden，但是只隐藏一部分订单，而会给你看到一点点订单。

### Validity instructions 有效性指令
1. Day orders: 日内指令
2. Good-till-cancelled orders (GTC): 一直有效直到 cancel
3. Immediate or cancel orders 也叫 fill or kill orders: 能成交的部分立即成交，不能成交的部分全部立即撤单。
4. Good-on-close: only filled at the end of the trading day. 如果是 market，也叫 market-on-close。
5. Good-on-open orders: only filled at the open of the trading day. 如果是 market，也加 market-on-open。
6. Stop orders 止损指令：
    1. stop-buy orders, 以 buy 的方式止损, 价格上涨的时候触发，short-position 应该下 stop-buy。
    2. stop-sell orders, 以 sell 的方式止损，价格下跌的时候触发，long-position 应该下 stop-sell。


## Security market indices
题目如果问 total return，要加入 dividend。
题目如果问 price return，只要考虑 price 变化。

1. Price-weighted index
    $\text{price-weighted index}=\frac{\text{sum of stock prices}}{\text{number of stocks in index adjusted for splits}}$
    股票价格加起来除以股票数。
    缺点：易收高价股影响。
    需要调整分母 divisor。
    
2. Equal-weighted index
    改进 price-weighted index，考虑的不是价格的绝对变化，而是价格的相对变化，目的是为了剔除高价股影响。假设每个股票购买金额是相同的。
    
    计算不同股票的 percentage change 的平均值的时候，既可以用算数平均，也可以用几何平均。
    缺点：易收小盘股的影响，因为小盘股更容易上涨下跌。
    
3. Market capitalization-weighted index
    改进 equal-weighted，剔除小盘股影响。
    
    1. 计算 0 时间点的总市值，设定一个点位。
    2. 计算 1 时间点的总市值，算出相应的点位。

    不需要计算每个股票的市值的权重，只需要加出来得到总市值，看总市值的变化即可。
    
    上市公司股票还可能分成流通股和非流通股，非流通股不能影响股票价格。
    缺点：易收大盘股的影响。
    
4. Float-adjusted market capitalization-weighted index
    主要目的是提出非流通股的影响，计算 0 时间点市值的时候，乘以的股份数要扣除非流通股。
    
5. Fundamental weighting
    改进 market-capitalization-weighted，提出大盘股的影响。
    按基本面加权，基本面越好的股票权重越高, 比如考虑 EPS，DPS 等。
    缺点：
        1. value-tilted 偏向成熟的价值型公司，因为有分红。不分红的股票大部分是成长新公司，权重变为了 0.
        2. contrarian investment 反向投资问题。

### Rebalancing and reconstitution
1. Rebalancing:
    在 equal-weighted 中，股票价格上涨是要减少权重的，因为假设的是每个股票购买金额是相同的。Equal-weighted needs most frequent rebalancing，只要股票价格发生变化，就需要调整。
    
2. Reconstitution:
    股票已经不满足构成要求了。
    Periodically add and delete securities that make up an index.
    
### Issues with fixed income indexes
1. large universe of securities
    范围太广
    Turnover is high in fixed income indexes, 指数的周转率更高，因为债券会到期，到期之后要从指数中剔除了。
    
2. dealer markets and infrequent trading
    相比于 equity，交易不活跃
    属于 dealer market
    
### Issues with commodity indexes
大宗商品 index 不用 spot price，而是用 forward price，因为现货价格不连续，而期货价格是连续的，因为交易有连续报价。

## Market Efficiency
Three forms of market efficiency:
1. The weak-form EMH 弱势有效市场
    股价完全反应了 currently available security market informaiton.
    技术分析无效，基本面分析有效，内幕消息有效。
    
2. The semi-strong form EMH 半强有效市场
    股价完全反应了 publicly available info (market info + non-market info).
    技术分析无效，基本面分析无效，内幕消息有效。
    此时 Passive port 比 active port 表现更好。
    
3. The strong form EMH 强有效市场
    股价完全反应了 public + private info.
    全部无效。No one can win.
    
**Testing EMH**
1. weak-form EMH
    1. statistical test of independence
    2. tests of trading rules
    3. 测试技术分析
2. semi-strong form EMH
    1. insider trading
    2. event studies (success)
3. strong form EMH
    1. 看高管自己能否获得超额收益
    2. security analysts (success)

## Market anomalies
CFA 协会持贬义态度。
1. Calendar anomalies / January effect
    1. tax-loss selling 避税
    2. window dressing

2. momentum anomalies 动量效应
    涨的好的股票会接着涨。
    跟 weak-form EMH 已经冲突。
    
## Behaviour finance
是对 EMH 假设的有效补充

1. loss aversion
    investors dislike loss more than they like gains.
    是 unsymetrical 的。传统认为应该是 symetrical 的。
    
2. disposition effect
    Willing to realize gains but unwilling to realize losses

3. Representativeness 代表性偏差
    Investors assume good companies or good markets are good investments.
    
## Classification of equity securities
1. common shares
2. preferred shares
    一般来说优先股没有投票权
    1. cumulative preferred shares: 某一年没有发股利的话，后一年再发的时候要把前一年的补回去。
    2. participating preferred shares: 参与优先股，可能获得最高的股利，也有权参与普通股股东的鼓励。
    3. convertible preferred shares: 可转换成普通股
3. callable common shares
4. putable common shares

### Non-domestic investments
1. direct investing: 直接投资
2. repository receipts 存托凭证（重点）：
    1. sponsored DR
        企业自己参与到了凭证发行中。
        投资者有投票权
    2. unsponsored DR
        企业自己没有参与，而是存托银行自己购买了企业的购票进行了销售，是由存托银行发起的。
        投资者没有投票权，投票权在存托银行受伤。
3. global depository receipts (GDRs): 在美国，和公司所在国之外的其他国际市场上发行的。多在 London 和 Luxembourg.
4. american depository receipts (ADRs): 以美元计算，在美国发行的。

## Industry Analysis
**Cyclical firm 周期性**
    如：汽车
**Non-cyclical firm 非周期性**
    1. defensive 防御性
        波动比宏观经济来的小
        如：医药，食品
    2. growth industries
        如：互联网
        
**Peer group**
可以使用两种分类系统：
    1. commercial classification
        Include only publicly traded for-profit companies. Updated more frequently than gov system.
    2. government classification

**Industry life cycle 重点**
根据描述能选出是哪一个。

1. Embryonic 胚胎期
    slow growth
    high prices 还未实现规模经济
    large investment required
    high risk of failure
    
2. Growth stage 成长期
    rapid growth
    limited competitive pressure
    falling prices 逐渐实现规模经济
    increasing profitability

3. Shakeout stage 整固期
    growth has slowed
    intense competition
    increasing industry overcapacity 产能过剩
    declining profitability
    increased cost cutting
    increased failures

4. Mature stage 成熟期
    slow growth
    consolidation
    high barriers to entry 形成垄断，进入壁垒高
    stable pricing
    superior firms gain market share

5. Decline stage 衰退期
    negative growth
    declining prices
    consolidation

## Pricing power 行业定价能力
1. Barriers to entry 进入壁垒高
    进入壁垒高，一般可以得出 pricing power 高，但不绝对
    进入壁垒高，退出壁垒低，才能得出 pricing power 很高
    
2. Industry concentration 行业集中度
    **High concentration doesn't guarantee high pricing power**
    
3. Industry capacity 行业产能
    1. undercapacity 产能不足，供小于求，high pricing power
    2. overcapacity 产能过剩，供大于求，low pricing power

4. Market share stability
    如果市场份额 highly variable，表明行业竞争激烈，pricing power 低。
    
## 波特五力模型
分析 competitive advantage，只要知道是哪五个。
1. rivalry among existing competitors 行业中本身的竞争。
2. threat of new entrants 潜在的行业进入者。
3. threat of substitute products 潜在的替代品。
4. bargaining power of buyers 下游定价能力
5. bargaining power of suppliers 上游定价能力


## 定量判断公司
### DDM model
1. General DDM
    假设每一期股利都知道的情况下，反求股价
    $P_0=\frac{D_1}{(1+k_e)^1}+\frac{D_2}{(1+k_e)}^2+...+\frac{D_n}{(1+k_e)^n}$
    
2. Constant growth DDM, 也叫 GGM 股利增长模型。
     假设每年股利的增长是恒定的话，求股价
     $P_0=\frac{D_1(1+g)}{k_e-g}$

Assumptions:
1. Firm expects to pay a dividend in one year.
2. The growth rate g is less than the required rate r.

必考：
    两阶段 gordon growth model。
    注意：第二阶段起始的股价用 GGM 模型算出来之后，要利用 required rate of return 折回现价！
    
### Multiplier model 乘数法
1. P/E 乘数
    1. leading P/E，使用下一年的 E_1
        $\frac{P_0}{E_1}=\frac{D_1/E_1}{k-g}=\frac{1-b}{k-g}$, where b is retention rate
        
    2. trailing P/E, 使用当年的 E_0
        $\frac{P_0}{E_0}=\frac{D_1/E_0}{k-g}=\frac{(1-b)(1+g)}{r-g}$

2. EV/EBITDA 乘数
EBITDA: earnings before interest, tax, depreciation and ammortization.

EV is total company value, not equity.
EV = market value of common stocks + market value of preferred stocks + market value of debt - cash and short-term investments

Market value of similar debt can be used.
其中 equity 不能用 book value 来做近似替代。
但是如果题目中没有 market value of debt 的话，是可以用 book value of debt 来替代的。

### Asset-based model
Asset = fair value of asset - fair value of liabilities.
适用于有大量有形资产的公司。如果公司有大量无形资产，很难判断。

更适用于 private companies 未上市公司。

估出来的价格是 conservative 的，因为衡量的是 liquidation 清算价值，没有考虑资产在未来可能带来的 cahs-flow。

































