title: CFA Notes - Corporate Finance
date: 2017-12-07 21:05:19
tags:
	- cfa
	- finance
categories:
	- finance
---
上下午一共 8%，20题。10 题计算，10 题概念。

# Capital Budgeting
**Types of capital projects**
1. Replacement project 替代项目
    1. to maintain current business 维持原来的业务
    2. for cost reduction purpose 降低营业成本
2. Expansion projects
    1. for existing product
    2. for new product or new services
3. Mandatory investment
    强制项目，NPV 可能小于 0，出于法律法规，必须要投。
4. Other projects
    投资该项目对公司的现金流的影响不容易分析出来。
    
# Basic principles for capital budgeting
1. decisions are based on cash flows, not accounting income
2. timing of cash flow is important 现金流出现时间越早越好
3. cash flow are analyzed on after-tax basis 考虑税后成本
4. financing costs are reflected in the project's required rate of return

**Mutually exclusive & independent projects**
1. independent projects 每个单独分析
2. mututally exclusive projects 排序，选择最佳
3. project sequencing 按序选择
4. unlimited funds vs. capital rationing
    1. 资金不受限时，只要 NPV > 0 就可以投

## Projects evaluation methods
### NPV 法
$NPV=CF_0+\frac{CF_1}{(1+k)^1}+\frac{CF_2}{(1+k)^2}+...+\frac{CF_n}{(1+k)^n}$

If NPV > 0, accept.
If NPV < 0, reject.

For mutually exclusive projects, select the one with highest NPV.

Advantage:
1. show the amount of gains as currency amount 直接以货币形式来衡量。
2. Positive NPV of project adds value to firm
3. realistic discountrate 现实的折现率

Disadvantage:
1. size of projects ignored 忽略了初始的投资规模

### IRR 法
计算当 NPV = 0 的时候的折现率是多少，也就是内部收益率。
$0=CF_0+\frac{CF_1}{(1+IRR)^1}+\frac{CF_2}{(1+IRR)^2}+...+\frac{CF_n}{(1+IRR)^n}$

If IRR > required rate of return, accept.
If IRR < required rate of return, reject.

Advantage:
1. reflect the profitability, rather than absolute amount

Disadvantage:
1. unrealistic discount rate, 假设收到的现金流都能找到同样的高回报率。
2. No IRR 有的项目算不出 IRR。
3. Multiple IRR: conventional flow 不会有，但是 unconventional cash flow 如果项目现金流符号有两次及以上的变动，可能会产生多 IRR。项目符号变动几次，就有几个 IRR。

如果和 NPV 冲突，选择 NPV。

### Payback period (PBP)
用多少年可以收回成本（不考虑未来现金流的折现）
$PBP=\text{full years until recovery}+\frac{\text{unrecovered cost at the beginning of last year}}{\text{cash flow during the last year}}$

越短越好。

Advantages:
1. simple
2. An indication of a project's risk and liquidity

Disadvantages:
1. ignore time value of money
2. ignore cash flows after payback period
3. ignore the profitability of the whole project

### Discounted payback period (DPB)
考虑货币时间价值，各个不同时期的现金流要折现以后再加起来。

现金流一样的情况下，DPB 的回收时间大于 PBP.

Advantage:
1. An indication of a project's risk and liquidity
2. consider the time value of money

Disadvantage:
1. ignore cash flows after payback period
2. even choose the shortest DPB, the NPV could stil be negative.

### Profitablity Index (PI) 盈利比率
$PI=\frac{\text{PV of future cash flow}}{CF_0}$

If PI > 1.0, accept
If PI < 1.0, reject

Adv:
1. measure the profitability of the project

Dis:
1. not reflect the absolute amount of project gain of the project

## NPV Profiles
![](https://i.imgur.com/WCMm6sY.png)

1. 横坐标是 cost of capital，亦即折现率。纵坐标代表该折现率下的 NPV。
2. 横坐标截点即是当 NPV = 0 时的 IRR。
3. 交点表示当 NPV 相等时两个项目对应的 cost of capital。

## Cost of capital
要寻找 optimal capital structure 是企业平均融资成本最低的资本结构。

### Weighted average cost of capital (WACC)
必背公式：
$\text{WACC}=W_d\times{}r_d(1-t)+W_{ps}\times{}r_{ps}+W_e\times{}r_e$

WACC 用来看：
1. 是不是在最优水平，越小公司 pricing power 越高
2. 为了折现公司未来自由现金流 FCFF

其中：
$W_d=\frac{\text{Debt}}{\text{Debt+Equity}}$
$W_e=\frac{\text{Equity}}{\text{Debt+Equity}}$

结论：
1. 计算的时候采用 market value，当时的市场数据。采用 book value 是没有意义的。
2. 即可以计算 current capital structure 也可以计算 target capital structure.

选择权重 W 时的优先排序：
1. use company's target capital structure
2. forcasted capital structure to infer the target structure
3. current capital structure

公司整体的现金流可以用 WACC 折现，单个 project 的现金流不可以。风险越大对应的 WACC 也越大。

1. 如果项目风险 > 公司风险，用 WACC 的话，NPV 被高估。
2. 如果项目风险 < 公司风险，用 WACC 的话，NPV 被低估。

#### 如何分别求回报率 $r_d$, $r_e$, $r_{ps}$
##### $r_d$ 债券要求回报率
1. YTM 法
就是用计算器求 YTM 持有期收益率。
使用在 WACC 中的时候要有 (1-t)，因为是 after-tax cost of debt.

2. Debt-rating approach: 如果债券价格不知道，不能使用 YTM。或者债券交易不活跃找不到 PV，那么认为同样债券评级的公司的收益率差不多，可以找其它相同评级的公司的债券收益率。

##### $r_{ps}$ 优先股要求回报率
优先股的股利是每年都确定的。
$r_{ps}=\frac{\text{dividend per share}}{\text{price per share}}$


##### $r_{e}$ 普通股要求回报率
1. CAPM 模型
    $\text{CAPM}=r_f+\beta(r_m-r_f)$
    注意
        1. $r_m$: return of market portfolio, 作为一个市场的 return
        2. $r_f$: 用长期国债收益率
        3. $\beta$: 个股股价和大盘的相关性

    1. 上市公司：$\beta$ 会直接给定
    2. 非上市公司：$\beta$ 要用 pure-play method 获得：
        1. 取上市公司的 $\beta{}'_{equity}$ 去杠杆，得到 pure beta，也叫 asset beta，可以当做非上市公司的 asset beta 用。
            $\beta{}'_{asset}=\beta{}'_{equity}\frac{1}{1+(1-t)\frac{D'}{E'}}$
        2. 加回非上市公司的杠杆
            $\beta{}_{equity}=\beta{}'_{asset}[1+(1-t)\frac{D}{E}]$
            
    如果在不同国家，CAPM 模型可以调整加上 country risk premium:
    $\text{CAPM}=r_f+\beta(r_m-r_f+CRP)$
    
    $CRP=\text{sovereign yield spread}\times{}\frac{\text{annualized standard deviation of equity index of developing country}}{\text{annualized standard deviation of sovereign bond market in developing market currency}}$
    简记为：
    $CRP=SYS\times{}\frac{\sigma_{equity}}{\sigma_{bond}}$ 

2. DDM 模型
**Gordon growth model**
$P_0=\frac{D_0(1+g)}{r-g}=\frac{D_1}{r-g}$
where:
    1. r: required rate of common stocks
    2. P_0: current market price for the stock
    3. g: growth rate, $g=ROE\times{}\text{retention rate}=ROE\times{}(1-\text{payout rate b})$
    4. Payout rate (b)=$\frac{DPS}{EPS}$

3. Bond yield plus risk premium
    在求出 bond yield 之后，加上一个给定的 risk premium 就当做 $r_e$ 来用。bond yield 要求。

### Optimal capital budget
当 marginal cost of capital 等于 investment opportunity schedule 的时候。

**break point**
公司总的融资达到多少钱之后，借款成本会上升。

### Floatation cost
1. Method 1
    变形 Gorden Growth Model：
    $r_e=\frac{D_1}{P_0}+g$

    此时把每股发行成本作为发行价格的抵减：
    $r_e=\frac{D_1}{P_0-F}+g$
    F: floatation cost per share

2. Method 2
    记账的时候作为期初的一次性现金流出。

CFA 协会认可 method 2 的做法，但是考试会考 method 1.

## Measure of leverage
分两种：
1. operating leverage: results from fixed operating costs, 指的是 sales 的变化，引起的 EBIT 的变化，主要取决于 COGS 和 SG&A.
2. financial leverage: results from debt financing and associated fixed costs, 指的是 EBIT 的变化，引起的 EPS 的变化，主要取决于 interest。

### Degree of operating leverage (DOL)
定义：
    $DOL=\frac{\Delta{EBIT}/EBIT}{\Delta{Q}/Q}$
    
计算：
    $DOL=\frac{S-TVC}{S-TVC-FC}$,
    1. S: sales/revenue
    2. TVC: total variable cost
    3. FC: fixed cost

### Degree of financial leverage (DFL)
定义:
    $DFL=\frac{\Delta{EPS}/EPS}{\Delta{EBIT}/EBIT}$
    
计算：
    $DFL=\frac{EBIT}{EBIT-interest}$
    
### Degree of total financial leverage
考试从没考过.
定义：
    $DTL=DOL\times{}DFL$

计算：
    $DTL=\frac{S-TVC}{S-TVC-FC-I}$

## Breakeven quantity
### Breakeven quantity of sales (BE)
总体盈亏平衡，产品卖到什么数量可以达到盈亏平衡
$Q_{BE}=\frac{FC+I}{P-VC}$

P-VC: 又叫 marginal contribution 边际贡献。

### Operating breakeven quantity (OBE)
只要 cover 固定成本即可
$Q_{OBE}=\frac{FC}{P-VC}$

## Dividends 股利
1. cash dividends 现金股利
    1. price ↓
    2. shares ×
    3. market value ↓
    4. stockholder's wealth ×
2. stock dividends 股票股利（每 10 股送 2 股）
    1. price ↓，按比例下降
    2. shares ↑
    3. market value ×
    4. stockholder's wealth ×
3. stock split 股票拆分，和股票股利完全一样
4. reverse stock splits 反向拆分（缩股）
    1. price ↑，按比例上升
    2. shares ↓
    3. market value ×
    4. stockholder's wealth ×

## Repurchases 回购
回购更加 flexible，因为现金股利股东会期望每年都发。
回个股价提供一个 supportive signal。

考试会考的三种回购方式：
1. buy in the open market
    1. most common
    2. max flexibility
    3. cost-effective 成本较低
    4. time-inefficient 完成时间长
2. buy a fixed number of shares at fixed price
    通过 tender-off 要约收购，一般是一个确定的 fixed price
    1. premium 溢价收购
    2. time-efficient 完成时间快
    3. cost high 成本较高
3. dutch-auction 荷式拍卖
    1. 成本不是一个固定的价格，是一组价格的区间

## Working capital management
核心是流动性管理。
1. primary sources of liquidity 健康流动性
    1. selling goods and services
    2. collecting receivables
2. secondary sources of liquidity 不健康流动性
    1. long-lived asset
    2. negotaiting debt agreements 债务减免/重组
    3. filing for bankruptcy and reorganizing company

**drags on liquidity** 收钱慢
**pulls on liquidity** 付钱快

### Liquidity management
**Account payable management**
Term "2/10 net 50" 的意思是，supplier 给一个激励，10 天还钱的话折扣 2%，最晚可以 50 天还钱。

## Corporate Governance of Listed Companies.
**Committee 委员会**
三大专业委员会，member 一定是独立董事。
1. Nominations committee 提名委员会
2. Compensation/Renumeration committee 薪酬委员会
3. Audit Committee 审计委员会

**Board**
1. 董事要专业性，professional
2. 董事要独立性，independent
3. 独立董事的占比要占到 majority。独董就是不在管理层，公司运营与他无关。
4. Experience 越多越好，一般以 10 年为界，不宜太久
5. Meets regularly without management presense
6. CEO & Chairman 一定不能是同一个人
7. Unrelated，不能是交叉董事

**Voting system**
1. systematic voting/statutory voting 法定投票前
2. cumulative voting
    Each shareholder is entitled one vote per share multiplied by the number of directors to be elected.
    是比较好的 corporate governance，可以更好地保护中小股东的利益。

**Shareholder's rights**
1. Golden parachutes: 保护 top manager
2. Poison pills，让现有股东以低价购买股票，稀释 Acquirer 股权
3. Greenmail



















