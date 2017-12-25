title: CFA Notes - Financial Statement Analysis
date: 2017-12-07 21:03:51
tags:
	- cfa
	- finance
categories:
	- finance
---
**四种会计意见**
1. Unqualified 无保留意见
2. Qualified 保留意见: 没有完全遵守会计准则
3. Adverse 反对意见: not presented fairly, not materially conforming with accounting standards
4. Disclaimer 无意见

**报表其它部分**
1. Notes
    1. accounting choices
    2. make necessary adjustments
    3. explanotory information about every line.
2. Management's discussion and analysis (MD&A):
    1.issues of concern
    2.nature of the business
    3.past results
    4.future outlook
    5.company's significant resources, risks and relationships.
    6.management's objectives and strategies
    7.*material events & uncertainties* 重大事项与不确定性
3. Proxy statemetns 代理投票权说明书 又叫 DEF-14A
    是股东让别人代理投票。
    也会披露高管薪酬。

管理层薪资可能出现在 notes / proxy statements 中。

Form 10-K 年报
Form 10-Q 季报
Form 8-K 重大事项公告

**报表制作流程**
1. general journal: list of entries *sorted by date*.
2. general ledger: list of entries *sorted by account*.
3. initial trial balance 初始试算表：before balance sheet，net yet relfected in the account system, 1st step in producing financial statement.
4. financial statements 财务报表

**会计公式**
1. Assets = Liabilities + Owner's Equity
2. Assets = Liabilities + Contributed Capital + Ending Retained Earnings
    A = L + C + ERE
3. Assets = Liabilities + Contributed Capital + Beginning Retained Earnings + Revenue - Expenses - Dividends
    A = L + C + BRE + R - E - D
    
**会计账目**
1. Assets
    1. prepaid expense，已经付钱，还没有服务。
    2. Unbilled revenue / accrued revenue, 未开票前为 unbilled, 和 A/R 一样处理，开票以后就转为 A/R.
    3. A/R
2. Liabilities
    1. Unearned revenue / deferred reveneu, 收到 cash 了，但还没有 deliver。
    2. Accrued expense，收到服务，还没有付钱。
    3. A/P

**IASB 下财表的定性特性**
1. 两个 fundamental
    1. relevance
    2. faithful presentation
2. 四个 enhancing
    1. understandability
    2. timeliness
    3. verification
    4. comparability

**标准制定**
FASB -> 制定了 US GAAP (rule based) -> 由 SEC enforce
IASB -> 制定了 IFRS (principle based) -> 由 FSA(UK) enforce

审计的财务报表只需要一年出一次就可以了，audited reports presented at least annually. 其余时间出的可以是不审计的。

**会计变更与追溯 (Notes中)**
1. change in accounting principle (retro)
2. change in accounting estimates (non-retro)
3. errors (retro)

**收入确认的准则**
共有的：
    1. 权利义务发生转移
    2. 收回款项可以确信

IFRS 特有的：
    成本可以衡量：costs can be measured reliably
    
US GAAP 特有的：
    买卖双方有合约：evidence of arrangement
    
**The line**
The line item: net income from continuing operations

Above the line: unusual or infrequent items (nonrecurring items), 税前列支

Below the line: discontinued operations, 税后列支

**收入确认的两个特例**
1. long-term contract 长期合同
    1. 结果可以确认时
        GAAP 和 IFRS 都用 *percentage of completion*：
        $\%=\frac{\text{cost incurred}}{\text{total cost expected}}$
    2. 结果不可以确认时
        GAAP 用 completed contract 法：revenue, expense and profit 只有在全部完工时才记账。
            
        IFRS 记 revenue = cost, profit 只在完工时记录

2. installment contract 分期合同
    1. US GAAP
        1. 不能合理确定结果时: installment sales methods
            $\text{profit}=\text{cash collected}\times{}\frac{\text{expected profit}}{\text{sales}}$
            
            
        2. 结果高度不确定时: cost recovery method
            当 cash 完全覆盖住成本时才能记 profit
            
    2. IFRS
        1. 结果可以合理确认时：
            比较 discounted PV 和 installment payment，差额确认为 interest over time。
            
        2. 结果不可以合理确认时：cost recovery method
            当 cash 完全覆盖住成本时才能记 profit

**其它特殊交易的收入确认**
1. Barter transaciton
    1. GAAP: if firm historically received cash payments for such goods/services, use fair value. Otherwise use carrying value 账面价值。
    2. IFRS: must be based on *fair value* of revenue from *similar non-barter transactions with unrelated parties*.
2. Round trip transaction: 双方交换 almost identical goods, 这样的交易不影响 NI 也不影响 CF。

**Gross reporting & net reporting**
1. gross reporting: 公司分开记录收支，需要满足四个条件：
    1. company is primary obligator under contract
    2. bears risk
    3. can choose the supplier
    4. has reasonable pricing power

2. net reporting: 只记录收支的差额。

**Basic EPS and dilutive EPS**
$\text{BEPS}=\frac{\text{Net income}-\text{preferred dividends}}{\text{Weighted average number of common shares outstanding}}$

![](https://i.imgur.com/HMGsqsk.png)

一般 DEPS 算出来比 BEPS 小，那么报 DEPS，但如果 DEPS 算出来比 BEPS 大，要选择 BEPS 作为 DEPS，这种是 anti-dilutive 的情况。

如果公司有 option 或 warrant，计算 DEPS 用的是 treasury stock method。公司会使用收入的期权实行费来回购股票，抵消一部分稀释。库存股没有投票权，也没有分红权。Issued shares 和 outstanding shares 之间的差异就是 treasury shares.

如果年中新发行新股的话，按新股存在的时长来计算新股的全年平均股数。

**Comprehensive Income**
All changes in equity except for owner contributions and distributions.
Equity = CI + Owner Contribution + Distributions.
CI = NI + OCI.


**Other Comprehensive Income (OCI)**
是记录在 BS 中 Owner's Equity 下的一项。
组成部分
1. foreign currency translation (not transaction)
2. pension liability adjustment (只有 DB, defined benefits)
3. *unrealized* gain/loss from *cash flow*: 必须是 unrealized，必须是 from cash flow。
4. *unrealized* gain/loss from available-for-sale securities: 必须是 securities，available-for-sale investments 都不算

**Income Statements 列式**
Revenue
-COGS (Cost of goods sold 主营业务成本)
\----------
Gross Profit 毛利
-SG&A (Selling, general and administrative expense)
\----------
EBIT 息税前收益
-I
-T
\----------
Net Income 净利润

**Balance Sheet 账目**
1. Assets
    1. Current assets
        1. Cash and equivalence
        2. Accounts receivable
        3. Inventory
        4. Prepaid expense
        5. Short-term investments
        6. Other current assets
    2. Non-current assets
        1. Property, plant and equipment (PP&E)
        2. Intangible assets
        3. Long-term investments
        4. Deferred tax assets (DTA)
        5. Pension assetse
2. Liability
    1. Current liability
        1. bank overdraft
        2. accounts payable
        3. accrued expenses
        4. unearned revenue
        5. The current portion of long-term debt
        6. Current taxes payable
    2. Non-current liability
        1. Notes payable
        2. Bonds payable
        3. Capital / Financial lease obligations
        4. Pension liabilities
        5. Deferred tax liabilities (DTL).
3. Equity
    1. Capital
        1. Common stocks
        2. Preferred stocks
    2. Additional paid-in-capital
    3. Treasury stocks
    4. Retained Earnings
        Net Income - dividends
    5. Accumultated OCI
        1. foreign currency translation adjustment on a foreign subsidiary
        2. Unrealized G/L on derivaties contrats accounted for as cash flow hedges
        3. Unrealized G/L on available-for-sale securities
        4. Certain costs of a company's defined benefit post-retirement plans that are not recognized in the current period.

**Marketable securities 记账**
1. Held-to-maturity: 例如 bond
    Measurement: amortized cost
    Unrealized G/L: not reported
    Realized G/L: I/S
2. Trading securities: 短期交易类金融资产，如 stock
    Measurement: fair value
    Unrealized G/L: I/S + B/S
    Realized G/L: I/S
3. Available-to-sale
    Measurement: fair value
    Unrealized G/L: B/S.Equity.OCI
    Realized G/L: I/S

相关金融产品导致的利息和分红，都确认在 I/S 中。

GAAP 和 IFRS 对于 marketable securities 唯一的差异：
Debt AFS 由汇率变化产生的影响：
GAAP 确认在 B/S.Equity.OCI
IFRS 确认在 I/S.

**Bad debt calculation**
Beginning bad debt balance allowance 坏账备抵
\+ bad debt expense 坏账开销
\- write-offs 销账
\---------------
Ending bad debt balance allowance

**Cash Flow activities**
1. operating activities: 和每天运营相关的现金流进出
2. investing activities: 由于投资引起的购买或出售
3. financing activities: 长期借钱，还钱，发新股，回购，分红（不包括利息）（对于金融公司/银行，这些属于 operating）


| Item | GAAP | IFRS |
| -------- | -------- | -------- |
| Interest received | CFO | CFO or CFI |
| Interest paid | CFO | CFO or CFF |
| Dividend received | CFO | CFO or CFI |
| Dividend paid | CFF | CFO or CFF |
| Taxes paid | CFO | CFO, CFI or CFF |


如果是银行，存款/贷款就是 operating activities。
如果投资的产品持有期很短，高流动性，或者本身以交易为目的，就不考虑为 investing activity，而是考虑为 financing activity。

**CFO 的两种计算方法**
GAAP 和 IFRS 都鼓励使用直接法，但都可以用间接法。
GAAP 要求使用直接法同时披露间接法，IFRS 没有要求。

1. Direct 直接法
    一收四支（必背一收和第一支）
    1. Cash received from customers=
        Opening A/R + Net sales - Closing A/R.
    2. -Cash paid to suppliers=
        Opening A/P + COGS - Closing A/P.
    3. -Cash paid to employees
    4. -Interest paid
    5. -Tax paid
2. Indirect 间接法
    从 revenue 出发，从 I/S 表的 net income 通过三步调整把 net income 调整成 CFO。
    1. 调整非现金收支
        1. 加上非现金支出
            \+ Depreciation
        2. 减去非现金收入
            考试一般不考
    2. 调整非经营项目 non-operating items
        1. 只考 fixed asset，处置固定资产的利得，这是 CFI 的与 CFO 无关：-gain/+loss
    3. 调整 balance sheet 项目
        考试考三个：
        1. A/R
        2. Inventory
        3. A/P
        
        -asset (A/R, inv)
        +liability (A/P)
        
**CFI 和 CFF 的计算**
1. CFI
    最重要的来源是处置固定资产 fixed income。
    
    必背公式：
    1. G/L = proceeds received - disposable NBV
    2. BV_end = BV_begin + purchase - disposable NBV - depreciation

2. CFF
    来源：发债融资，发股融资，股利支付
    计算只会考第三个，支付多少股利
    
    必背公式：
    1. RE_end = RE_beging + NI - Div_declared
    2. $\text{Div}_{\text{paid}}=-\text{Div}_{\text{declared}}+\Delta{}\text{Div}_{\text{payable}}$

**Free cash flow 自由现金流**
两种：
1. Free cash flow to firm (FCFF) 公司自由现金流
2. Free cash flow to equity (FCFE) 股东自由现金流

必背公式：
1. FCFF = CFO - FCInv + Int * (1 - tax rate)
2. FCFE = CFO - FCInv + Net borrowing

where:
* FCInv = fixed capital investment (net capital expenditure)
* Int = interest expense
* net borrowing = debt issued - debt repaid

一般来讲 net borrowing 比较大，所以 FCFE > FCFF.

如果用 FCFF 计算公司价值，折现率要用 WACC。
如果用 FCFE 计算股东价值，折现率用股东要求回报率 r_e.

## Financial analysis techniques
### Common-size analysis
两家公司不同规模，应该用百分比来比。
不同的财务报表，采用的 denominator 不一样。
1. common-size B/S: 采用 total assets
2. common-size I/S: 采用 revenue
3. common-size C/S: 采用 revenue，或者：
    + outflow items 采用 total cash outflows
    + inflow items 采用 total cash inflows

### Ratio analysis
#### Liquidity ratio
衡量短期偿债能力。
考试一般给一笔业务，问对 ratio 产生什么影响。
1. current ratio 流动比率
    $\text{current ratio}=\frac{\text{current assets}}{\text{current liabilities}}$
    一般认为比率 2 是比较理想的。

2. quick ratio 速动比率
    $\text{quick ratio}=\frac{\text{current assets}-\text{inventory}}{\text{current liabilities}}=\frac{\text{cash}+\text{marketable securities}+\text{receivable}}{\text{current liabilities}}$
    认定 inventory 变现能力较差，不予考虑。
    
3. cash ratio 现金比率
    $\text{cash ratio}=\frac{\text{cash}+\text{marketable securities}}{\text{current liabilities}}$
    认为 receivable 流动性也不够，看当下即刻能变现的流动性如何。

#### Solvency ratio
衡量长期偿债能力。杠杆水平越高，长期偿债能力越差。杠杆水平越低，长期偿债能力越好。

1. Financial leverage
    $\text{financial leverage}=\frac{\text{asset}}{\text{equity}}$
    
2. interest coverage 利息保障倍数
    $\text{interest coverage}=\frac{\text{EBIT}}{\text{interest expense}}$
    看公司长期偿债能力高低。如果比率是 6，表明赚的钱是利息水平的 6 倍。

#### Activity ratio
Inventory turnover 和 receivable turnover 越高越好。
Payable turnover 越低越好。
1. Inventory turnover
    $\text{IT}=\frac{\text{COGS}}{\text{average inventory}}$
    $\text{inventory period}=\frac{365}{\text{IT}}$
    
2. Receivable turnover
    $\text{RT}=\frac{\text{net revenue}}{\text{average A/R}}$
    $\text{receivable period}=\frac{365}{\text{RT}}$，也叫 collection period。
    
3. Payable turnover
    $\text{PT}=\frac{\text{purchase}}{\text{average A/P}}$
    当 $\Delta{\text{inventory}}=0$ 时，可以用 COGS 代替 purchase。
    $\text{payable period}=\frac{365}{\text{PT}}$，也叫 payment period。
    
4. Operating cycle 运营周期
    $\text{OC}=\text{inventory period}+\text{collection period}$

5. Cash conversion cycle 现金周转周期
    $\text{CCC}=\text{inventory period}+\text{collection period}-\text{payment period}$

#### Profitability ratio
1. Gross profit margin 毛利率
    $\text{GPM}=\frac{\text{gross profit}}{\text{revenue}}=\frac{\text{revenue}-\text{COGS}}{\text{revenue}}$
    越高说明 COGS 越低，公司定价能力越高

2. Net profit margin 净利率
    $\text{NPM}=\frac{\text{net income}}{\text{revenue}}$
    
3. Return on assets
    $\frac{\text{net income}}{\text{total assets}}$
4. Return on equity
    $\frac{\text{net income}}{\text{total equity}}$
    
#### Valuation ratio
1. P/E ratio
$\frac{\text{price per share}}{\text{EPS}}$


### Dupont analysis
#### 三分
$\text{ROE}=\frac{\text{net income}}{\text{revenue}}\times{}\frac{\text{revenue}}{\text{assets}}\times{}\frac{\text{assets}}{\text{equity}}\\=\text{profit margin}\times{}\text{asset turnover}\times{}\text{financial leverage}$
前两项上升是健康的，最后一项上升是不健康的。

#### 五分
$\text{ROE}=\frac{\text{net income}}{\text{EBT}}\times{}\frac{\text{EBT}}{\text{EBIT}}\times{}\frac{\text{EBIT}}{\text{revenue}}\times{}\frac{\text{revenue}}{\text{assets}}\times{}\frac{\text{assets}}{\text{equity}}\\=\text{tax burden}\times{}\text{interest burden}\times{}\text{EBIT margin}\times{}\text{asset turnover}\times{}\text{financial leverage}$

## Inventory
### Product cost & periodic cost
Product cost 即 capitalized cost，可以资本化。判断标准：达到可销售状态之前的必要支出，可以资本化到 inventory 中。

Periodic cost 即 expensed cost，必须费用化：
1. abnormal waste of materials 不正常损耗
2. storage costs 存储成本（除非是生产过程需要的，生产完之后的 stroage cost 要费用化）
3. administrative overhead 行政费用
4. selling costs 销售费用，算在 SG&A 中

### Inventory accounting
四种计价方法：
1. specific identification, 存货非常重要时采用，出的是哪个就按哪个的实际成本
2. LIFO, 后买的先售出，只有 GAAP allow。
    如果 inventory 价格上涨的话，COGS 比较高，inventory 价值比较低，CFO 更高。
3. FIFO, 先买的先售出
    如果 inventory 价格上涨的话，COGS 比较低，inventory 价值比较高，CFO 更低。
4. Weighed average (AVCO) 平均，不考

### Inventory system
不管记账方法是哪种，都有两种盘存方法。盘存和记账是独立的。
1. Periodic 定期盘存
    用存货确定 COGS。
2. Perpetual 永续盘存
    每卖掉一个产品，就计算一次成本。
    
必背：
1. FIFO 和 Specific 的情况下，periodic 和 perpetual 算出来的 COGS 是一样的。
2. LIFO 情况下，periodic 和 perpetual 算出来的 COGS 一般来说不一样，periodic 下算出来更高。
3. WA 下，两者最不可能一样。

### Inventory valuation 存货估值
1. GAAP
    比较 cost 和 market replacement cost 重置成本。
    如果 market 在 [NRV-NPM, NRV] 之间，可以用 market，否则用边界值。
    不允许 write-up，不允许 reversal，除了大宗商品农产品。
2. IFRS
    如果 cost 比 net realizable value 小，就发生了减值，减到 NRV。
    不允许 write-up，但可以 reversal。
    
* NRV: net realizable value = sales price - selling cost
* NPM: net profitable margin

## Long-term assets
长期资产，以 PP&E 为最重要组成部分。
### 资本化和费用化
1. capitalize
    确定为 assets，体现在 B/S。以后每年记账的时候都要计算 Net Book Value 和 Carry Value。
    对存货：达到可销售状态之前的所有必要支出都可以资本化。
    对固定资产：达到可使用状态之前的所有必要支出都可以资本化。
    如：
        1. purchase price
        2. tax, freight, insurance
        3. delivery
        4. installation
        5. testing
    I/S 上属于 CFI，CFO 会较高，CFI 较低。
    
2. Expense
    作为当期费用，不会体现在 B/S 上。如果是生产中用的，体现在 COGS，如果是管理中用的，体现在 SG&A。
    达到可使用状态之后的支出必须费用化：
    如：
        1. depreciation
        2. repair and maintenance
        3. staff training
        4. asset enhancement costs
    I/S 上属于 CFO，CFO 会较低，CFI 较高。
    
Intangible assets 的费用一般要费用化：
1. R&D cost, GAAP 费用化，IFRS 中 research 部分费用化，development 部分资本化。

Interest：
利息前期资本化的话，会使得前期 NI 较高，之后在费用化的当期 NI 较低。
1. GAAP 要求全部资本化。
2. IFRS：如果借款用于临时投资，产生的投资收入，可以抵减该笔借款的当期利息，net 的部分作资本化。

### Depreciation Methods
#### 1. Straight line 直线折旧
按使用时间加权：
$\text{SL depreciation expense}=\frac{\text{cost}-\text{residual value}}{\text{useful life}}$

#### 2. Accelerated Depreciation 加速折旧
Double-decline-balance 双倍余额递减法
剩下的余额每年都折旧一半。算折旧的时候不考虑 salvage value，但是最后一年还是要留下 salvage value，否则就是过度折旧。

#### 3. Units-of-production 按使用量加权折旧
$\text{depreciation expense}=(\text{original cost}-\text{salvage value})\times{}\frac{\text{output units in period}}{\text{total output units in life}}$

### Impairment and revaluation model
1. IFRS
    Carrying value 账面净值 > recoverable amount (可回收净额) 
    ，即发生了减值，减值捡到的金额就是 recoverable amount。

    RA 为两者之高：
    1. fair value - costs to sell (类似存货中的 NRV).
    2. value in use 使用价值: the present value of future cash flow from continued use.


2. GAAP
    Step 1. impairment test
        carrying value > undiscounted cash flow generated by the asssets.
        比较未折现未来现金流，大于的话就发生了减值，减值到下面的值.
        
    Step 2. loss measurement
        carrying value - (fair maket value) or (discounted cash flow generated by the assets)
        减值到折现的未来现金流，一般任何和 fair market value 是一回事。

一旦 impairment 已经发生的话，是否可以回转：
1. GAAP
    1. held for use -> recovery not allowed
    2. held for sale -> recovery allowed

2. IFRS
    recoveries allowed except for goodwill, but no written up.
    
Impairment effects


| Item | Effect |
| -------- | -------- |
| Cash flow     | no effect     |
| Assets     | decrease     |
| Equity     | decrease     |
| Debt/Equity ratio     | increase     |
| Current net income, ROA, ROE     | decrease     |
| Future depreciation expense     | decrease     |
| Future net income, ROA, ROE     | increase     |

**Investment property 投资性房地产**
不是为了自住，而是为了投资收益：1. 资本利得，2. 出租的房租。

两种模型：
1. cost model，使用历史成本模型，IFRS 和 GAAP 都有。
2. fair value model，使用公允价值，只有 IFRS 才有。

Fair value model，超过 historical cost 的，进入 I/S.
Revaluation model，超过 historical cost 的，进入 B/S.Equity.OCI.

## Intangible assetes 无形资产
1. 分类
    1. identifiable 可辨认
        patent, trademarks, copyright
        摊销
    2. unidentifiable 不可辨认
        goodwill
    3. internally generated
        内部研发

2. 年限
    1. 有固定使用年限的，每年摊销 amortization
    2. 没有固定使用年限的，每年做减值测试

3. 内部产生的无形成本
    1. research 早期阶段：全部费用化
    2. development 后期开发阶段
        IFRS: capitalize
        GAAP: expense (除了研发软件可以资本化)

## Long-term liabilities and leases
### Long-term liabilities
Market rate 和 coupon rate 的比较：
1. 如果 market rate < coupon rate: premium bond
2. 如果 market rate > coupon rate: discounted bon

**Bond 在财报上的记账**
使用 BASE 法则，记在 liability 里：
beginning + addition - subtraction = ending

addition: 新增的应付利息

subtraction: 还掉的利息

BS 上记录 beginning 和 ending
IS 上记录 addition，是手里借到的钱会产生利息的。
CS 上记录 subtraction (interest paid 是 CFO 的流出)，就是付出的 coupon。

必背结论：
1. premieum bond 的 CFO 被低估了：如期初 CFF 流入 105，期末流出 100，增值 5，CFF 被高估，CFO 被低估。
2. discount bond 的 CFO 被高估了：如期初 CFF 流入 95，期末流出 100，减值 5，CFF 被低估，CFO 被高估。
3. premiuem bond 在 BS 上的负债越来越小，discounted bond 在 BS 上的负债越来越大。负债即债券价格。
4. 在到期的时候债券价格都会回归面值。
5. 一部分还利息一部分还本金的还款方式叫做 amortization premium. 利息部分还还不够越欠越多的还款方式叫 amortization discount.
6. interest expense = L_0 x Market Rate 每一期期初欠的钱乘以市场利率就是每一期的利息费用。

**Issuance cost 发行成本的记账**
1. GAAP
    liability 不变，asset 中增加的 cash 减掉发行成本，再记录 deferred charge。因此 GAAP 中发行成本不影响 liability 价格。
2. IFRS
    认为融资融到的 liability 直接就扣除了发行成本，因此 liability 减少了，asset 中增加的 cash 也对应减少，会影响 liability 价格。
    
**Debt convenant 债务条款**
1. affirmative covenant 债务人必须做的 (issuer)
2. negative covenant 债务人不能做的 (issuer)


### Leases
Types:
1. operating lease：租完以后没有关系，所有权没有转移。不在 BS 中，而是在 IS 中，又称表外融资。
2. financial lease: 租完以后所有权发生了转移。确认资产、负债，记录 B/S.

Accounting for financial lease:
1. 租赁期初：B/S.asset.leased asset=B/S.liability.leased liability=PV of minimal lease payment
2. 租赁每期：leased asset 要记录 depreciation，leased liability 要记录 interest expense & principal repayment.
3. I/S, 资产会产生贬值，负债会产生利息
4. C/S, pirncipal repayment->CFF, interest expense->CFO.

必背结论：
1. operating lease 和 financial lease 总费用是一样的
2. financial lease 总费用前高后低
3. CFO 是 financial lease 下的高
4. net income 都是前低后高
5. EBIT 是 capital lease 一直都更高

### Framework for Pension Plans
1. 两种 pension
    1. DB (defined benefit): 退休后公司每年给的 benefit 一定，投资风险由公司承担。
    2. DC (defined contribution): 每年公司投入的钱是一定的，但是员工退休后的 pension 不作保证。员工承担投资风险。

DB plan 可以只列 net value。即 BS 上有两项：plan asset 和 plan liability，列式的时候只列 net 的抵消金额。

## Income Taxes
1. DTA: deferred tax assets
2. DTL: deferred tax liabilities

$\text{Tax Expense}=\text{Tax Payable}+\Delta{DTL}-\Delta{DTA}$
    Tax Expense 是公司财务算出来的。
    Tax Payable 是税务局算出来的实际要交的税。
    
将来税率改变之后的 DTA&DTL 变化的计算：
old DTA&DTL = |CV - TB| x old tax rate
new DTA&DTL = |CV - TB| x new tax rate
$\text{new DTA&DTL}=\text{old DTA&DTL}\times{}\frac{\text{new tax rate}}{\text{old tax rate}}$

TB: tax base, net amount of an asset/liability used for tax purpose.

**Tax loss carry forward**
以前年度的损失可以用来抵税，但是有年限限制。carry forward 不超过五年。如果五年内都没有盈利的话，DTA 越来越不值钱，DTA 要计提减值损失 valuation allowance，用于抵减 DTA。

如果认为 DTA 能被回转的概率 < 50%，计提 valuation allowance。
如果认为 DTL 无法回转（公司高速发展的情况下），将来也不用多缴税了，把它视为 Equity。

**Effective tax rate**
$\text{effective tax rate}=\frac{\text{income tax expense}}{\text{pretax income (EBIT)}}$
和法定税率 systematic tax rate 不一样。


CFA 1 中只有三个备抵账户：
1. accumulate depreciation 抵减 fixed asset
2. bad debt allowance 抵减 account receivable
3. valuation allowance 抵减 DTA


必背结论：
1. 未来 tax rate 上涨，DTA 和 DTL 都上涨。未来 tax rate 下降，DTA 和 DTL 都下降。