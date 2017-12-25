title: CFA Notes - Economics
date: 2017-12-07 21:00:27
tags:
	- cfa
	- finance
categories:
	- finance
---

占比 10%，24 题，把重点把握。
考试基本以定性为主，计算题集中在最后的国际经济学。
精力主要放在微观经济学和国际经济学上，国际 5 题，微观/宏观各 10 题左右

# 微观
## Demand and supply
需求曲线和供给曲线，描绘的都是 inverse demand function 和 inverse supply function，是以 P 为应变量（y 轴），Q 为自变量（x 轴）的。
但是题目中说 demand function 和 supply function 的时候，都应该是以 Q 为应变量，P 为自变量才对。

1. Move: price 的改变使得沿线移动。
2. Shift: 其它因素的变化使得线平移。
    1. demand:
        1. income 增加，曲线右移
        2. substitute 价格上升，曲线右移
        3. complementry 价格上升，曲线左移
    2. supply
        1. cost 增加，曲线左移

Excessive supply = supply - demand, 超额供给价格会下降
Excessive demand = demand - supply, 超额需求价格会上升

Stable equilibrium: 价格偏离均衡点后还可以回归。
Unstable equilibrium: 价格偏离之后越偏越远，不能回归。

## Auctions
决定均衡价格的一种方法。
对标的物不同的分类：
1. common value auction：对不同竞标者，有相同的价值
    * winner's curse: 中标人为了中标要加价，但利润会减少。
2. private value auction: 对每个竞标者有自己不同的心理价格。

根据拍卖形式的不同的分类：
1. ascending price auctoin (English auction) 价格上升的拍卖
2. sealed bid auction 封闭式拍卖
3. descending price auction (Dutch auction) 价格下降的拍卖

## Surplus
![](https://i.imgur.com/GMiMFwk.png)

### Consumer surplus
消费者消费一定数量的某种商品愿意支付的最高总价格和实际总价格之间的差异。
黄色三角形部分的面积。

### Producer surplus
灰色三角形部分的面积。

### Total surplus
total surplus = consumer surplus + producer surplus

什么时候 total surplus 最大？当 marginal cost = marginal benefit 的时候。

**Deadweight loss 无谓损失**
![](https://i.imgur.com/Wi95Gf2.png)
1. underproduction 由于生产不足导致的
2. overproduction 由于产量过剩导致的

## Elasticity 必考
### Price elasticity
$\Delta{P}$ 引起的 $\Delta{Q}$ 的波动，价格变化以单位引起的需求量的变化。

1. 弧弹性
    需要知道两点
    $e_d^x=\frac{\Delta{Q}/Q}{\Delta{P}/P}=\frac{Q_2-Q_1/\frac{Q_1+Q_2}{2}}{P_2-P_1/\frac{P_1+P_2}{2}}$

2. 点弹性
    用公式求导求出单点切线斜率
    $e_d^x=\frac{\Delta{Q}}{\Delta{P}}\times{}\frac{P}{Q}$

**Perfectly elastic**, 水平横线，elasticity is infinity, 价格的任意改变都会使 demand 变为 0.

**Perfectly inelastic**，垂直线，elasticity is 0, 价格无论如何变都不会改变 demand。

If e=1, 叫做 unit elastic，是 total revenue maximized 的位置。
If e>1, 叫做 elastic，价格下降可以使得 revenue 上升。
if e<1, 叫做 inelastic，价格上升可以使得 revenue 上升。

谁的弹性小，谁承担的税收多。

### Cross elasticity
其它商品价格的变动对我自身商品需求量的影响程度。

1. 弧弹性
    $e_c^x=\frac{\Delta{Q}/Q}{\Delta{P}/P}=\frac{Q_2-Q_1/\frac{Q_1+Q_2}{2}}{P_2-P_1/\frac{P_1+P_2}{2}}$
    
2. 点弹性
    $e_c=\frac{\Delta{Q}_x}{\Delta{P}_y}\times{}\frac{P_y}{Q_x}$
    
    要需求量和其它商品的求导。

If e_c > 0, X 的价格上升导致 Y 的需求量上升，是替代品。
If e_c < 0, X 的价格上升导致 Y 的需求量下降，是互补品。

### Income elasticity
收入变动对需求变动的影响。

1. 弧弹性
    $e_I=\frac{\Delta{Q}/Q}{\Delta{I}/I}=\frac{Q_2-Q_1/\frac{Q_1+Q_2}{2}}{I_2-I_1/\frac{I_1+I_2}{2}}$
    
2. 点弹性
    $e_I=\frac{\Delta{Q}}{\Delta{I}}\times{}\frac{I}{Q}$

1. e_I > 0: 收入增加需求也增加，normal goods
    1. 0 < e_I < 1: 弹性小，生活必需品，necesities
    2. e_I > 1: 弹性大，奢侈品，luxuries
2. e_I < 0: 收入增加需求减少，inferior goods

## Indifference curve 无差异曲线，表示消费者的主观愿望 
![](https://i.imgur.com/ZCeGPpC.png)

曲线代表两个商品的组合，曲线上任意一点，两个商品带来的总效用都是一样的。

结论：
    1. 无差异曲线有无数条，越往上效用越高。
    2. 相交的无差异曲线是不成立的。
    3. 向原点下凸。


**Marginal rate of substitution (MBS)**
就是无差异曲线切线的斜率。
边际替代率是抵减的。

## Substitution and income effects
X 价格下降，对于 X 的需求量上升，这个叫 total effect 总效应。

* substitution effect:
    x 价格下降，用 x 替代 y，导致 x 的需求量上升
    价格和需求量相反的关系，叫做正的效应
    
* income effect:
    x 价格下降，名义收入不变，实际收入增加
    x 的需求量是否上升，取决于 e_I 收入弹性
    
1. normal goods: ++ = +
    substitution effect is +
    income effect is +
    total is +

2. inferior goods: ++ - = +
    substitution effect is ++
    income effect is -
    total is +

3. giffen goods: + -- = -
    substitution effect is +
    income effect is --
    total is -
    

## Veblen goods
需求曲线也是向上倾斜的，price is used by the consumer to signal social status.

和 giffen 的不同点：
1. giffen 是劣质品，veblen 是炫耀性商品。
2. giffen 有理论支持，veblen 没有理论支持，只是一种现象。

## Economic profit
随意看看，不是必考点
 ![](https://i.imgur.com/KTt5aqz.png)
**Normal profit** is the accounting profit that makes economic profit zero.

Accounting profit = Economic profit + normal profit.

## Product 产量（就是 Q）
**Total product**: sum of output from all inputs during a time period, denoted as total output (Q) using labor quantity (L).

**Average product (AP)**: measured as total product divided by the number of worker hours used at that output level (Q/L).

**Marginal product (MP)**: amount of additional output resulting from using one more unit of input $\Delta{Q}/\Delta{L}$.

**Law of diminishing retursn**
画出下面的图：
![](https://i.imgur.com/lTTA9NF.png)

先画出 TP/AP，MP 分别与 AP 最高点，TP 零点相交。

当 MP = 0 时，TP 最大。

## Revenue
类似于 product：
**Total revenue**, price x product
**Average revenue**, totla revenue / product
**Marginal revenue**, $\Delta{R}/\Delata{Q}$

**Perfect competition 完全竞争情况下**
E_d is infinity, price is constant, 一条水平线，
此时 Revenue 与 Q 的图形和上面 product 的图形完全一样。

## Cost
长期来看，所有生产要素都可以改变。
短期来看，一般认为劳动力和原料可以改变，其它都固定不变。

记两张图：
 ![](https://i.imgur.com/mNZt5Oh.png)

 ![](https://i.imgur.com/O00iET2.png)

结论：
1. Marginal cost 先降后升
2. Marginal cost 和 ATC, AVC 都相交在最低点。
3. Marginal cost 上升到最高点的时候，正好对应到 marginal cost 的最低点
4. ATC 最低的点并不是利润最大化的点。
5. 利润最大化的点发生在 marginal revenue = marginal cost 的时候。

## Breakeven point and shutdown point
Under perfect competition，价格和需求无关，直接比较 average：
1. AR > ATC: 短期生产，长期生产
2. AR = ATC: breakeven point
3. AVC < AR < ATC: 短期生产，长期退出
4. AR = AVC: shutdown point
5. AR < AVC: 短期停工，长期退出

If under imperfect competition，价格和需求有关，上面的比较全部换成 total 的, 结论不变。

## Economies of scale and diseconomies of scale 规模经济
产量增加之后，成本先减少后上升。
减少的这一段叫做 economies of scale.
增加的这一段叫做 diseconomies of scale.

## Market Structure
四种结构中，只有 perfect competition 是最有效的，其它都不是最有效的，厂商都有一定的 pricing power。除了完全竞争市场，其它都有 underproduction。

### 1. Perfect competition
也叫 price taker market。所有其它 market 都叫 price searcher markets。
Many firms, no idfference in products, each seller is small-size, no barrier to entry or exit.

短期内可能有 economic profit/loss，长期内只能有 normal profit。

### 2. Monopolistic competition 垄断竞争
Many firms, some difference in products, firms are relatively easy to enter and exit, demand curve highly elastic.

发生在垄断竞争市场的特定：
1. innovation and product development
2. many advertising
3. brand names

短期可能有 economic profit/loss，长期只能有 normal profit。

### 3. Oligopoly 寡头竞争
Small number of sellers, significant barriers to enter and exit, kined demand curve model, nash equilibrium model, stackelberge dominant firm model.

### 4. Pure monopoly 完全垄断
Single seller, high barriers. Price searchers.
产量较少，价格较高。

**重点公式**
Relationship between marginal revenue and price elasticity is: $MR=P\times{}(1-\frac{1}{e_P})$，对任何需求曲线向下的都成立。


**First-degree**: 按照每一个消费者愿意支付的最高价来支付。
**Second-degree**: pricing baesd on quantity
**Third-degree**: pricing based on demographic groups.

价格歧视可以一定程度上减少市场的无效性。

**政府定价**最常用 Average cost pricing, 按照平均成本来定价。

## Concentration measures
1. N-firm concentration ratio: 把前几的公司的市场份额加起来即可，没有考虑到兼并收购问题

2. HHI index: 把前几的公司的市场份额平方相加, 考虑了兼并收购，但是没有考虑市场进出壁垒

---
# 宏观
## GDP
Concepts:
1. GDP: 在某国工作的包括外国人的生产总值
2. GNP: 某国国民的生产总值，包括在国外工作的本国公民

必背:
**nominal GDP**: $GDP_t=\sum^N_{i=1}P_{i,t}Q_{i,t}$
**real GDP**: $GDP_t=\sum^N_{i=1}P_{i,t-5}Q_{i,t-5}$
**GDP deflator*: $\frac{\text{nominal GDP}}{\text{real GDP}}$

## GDP 的计算
**非常重要**
1. Expenditure approach:
    GDP = C + I + G + (X-M)
    C: consumption 国民消费
    I: investment 投资
    G: government 政府支出
    X: export 出口额
    M: import 进口额
2. Income approach
    GDP = national income + capital consumption allowance + statistical discrepeancy
    
    National income = 劳动所得工资 + 土地所有者得到的地租 + 资本 + 企业家利润 + 所得利息
    
    Personal income = national income - indirected business tax - corporate income tax - undistributed corporate profit + transfer payment
    
    Personal disposable income = personal income - personal taxes

## Saving and investment
S - I = (G - T) + (X - M)
1. G - T 财政平衡
    1. G=T 财政平衡
    2. G>T 财政赤字
    3. G<T 财政盈余

2. X- M 贸易平衡
    1. X=M 贸易平衡
    2. X>M 贸易顺差（盈余）
    3. X<M 贸易逆差（赤字）

## IS-LM 模型
### IS curve
表现的是商品市场的均衡状态
Y = C + I + G + (X-M)
![](https://i.imgur.com/oh58gkh.png)

* Movement 
    利率的变化会导致沿着线的变动。
* Shift
    G 增加，Y X-M 增加，右移

### LM curve
表现的是货币市场的均衡状态，货币供给等于货币需求：MS=MD.

货币的三种需求：
1. transaction demand 交易
2. precautionary demand 预防性
3. speculative demand 投资

$\frac{MS}{P}=L_1(Y)+L_2(r)$
MS: money supply。
p：物价水平，用于剔除通胀影响。
L_1 和 Y 是同向关系，Y 增加 L_1 增加。
L_2 和 r 是反向关系，r 增加 L_2 减少。

因此 Y 和 r 是同向关系。

货币政策可以影响 LM 曲线。
财政政策是不能影响 IS 曲线的。

## AD-AS model
### Aggregate demand (AD) 曲线
AD 曲线是 IS-LM 两个市场都达到了平衡，即 IS-LM 的交点。
从长远来看物价水平 P 会改变。把 Price leve 画在纵轴，Y 保留在横轴，得到 AD 曲线。

AD 曲线更加平坦，因为 Investment 只对利率变化敏感，对别的都不敏感。

* Movement
    沿着线的移动，就是物价水平 P 的变化
* Shift
    影响 IS 和 LM 曲线的，都会影响到 AD 曲线。
    任何导致 IS 右移的，都会导致 AD 右移。
    任何导致 LM 右移的，都会导致 AD 右移。
    
### AS Curve (aggregate supply curve)
![](https://i.imgur.com/0oyqCJX.png)
分三种：
1. VSRAS 不考
2. SRAS
    向上倾斜。
3. LRAS
    垂直曲线，弹性为 0. 总供给长期来看固定在一个产出水平上，这个位置叫做 potential GDP，就是国家利用了全部资源能实现的最大 GDP。对应 full employment 的状态。

影响 LRAS 的因素都会影响 SRAS。
影响 SRAS 的因素都是成本因素，成本增加会左移，成本减少会右移。

### Recessionary Gap
1. Recession 萧条：AD 需求不足
2. Inflaiton 过热：AD 需求过剩
3. Stagflation: AD 过剩 + AS 不足 (经济停滞+通货膨胀)

## Business Cycle
任何国家的经济在长期里都是上涨趋势
1. Through 复苏期
2. Expansion 扩张期
3. Peak 顶峰期
4. Contraction 衰退期

## Business cycle theories
1. neoclassical 新古典注意
    1. 认为是技术的进步产生了经济周期
    2. 认为政府不要干预

2. Keynesian school 凯恩斯
    1. 认为是总需求  AD 的变化导致了企业家预期的变化，引起了经济周期。
    2. 认为政府要干预

3. Monetarist 货币学派
    1. 认为央行滥发货币导致经济周期
    2. 认为政府不要干预

## Unemployment
1. working-age population: 适合工作的年龄的人群
2. labour force: 实际参加工作的+有意愿找工作的人（不包含不想找的）
3. unemployed:
    1. long-term unemployed: 3-4 months
    2. frictionally unemployed: 临时性的
4. Underemployed: 高人才找到了低薪工作
5. Discouraged worker: 不愿意工作

**重要**
1. unemployment rate: $\frac{\text{number of unemployed}}{\text{labor force}}\times{}100%$
2. participation ratio: $\frac{\text{labor force}}{\text{working-age population}}$

## Inflation
1. inflation: 通胀：整体物价水平上升
2. Hyperinflation: 恶性通胀
3. Deflation: 紧缩：物价水平下降
4. Disinflation: 速度放缓的通胀

紧缩比通胀更难治理。

**CPI 的计算，要掌握**
$CPI=\frac{\text{cost of basket at current price}}{\text{cost of basket at base period price}}=\frac{\sum{}Q_0\times{}P_1}{\sum{}Q_1\times{}P_0}$

1. lasperes index:
全部是用过去的 Q。
$CPI=\frac{\sum{}Q_0\times{}P_1}{\sum{}Q_0\times{}P_0}$

2. paasche index:
全部使用现在的 Q。
$CPI=\frac{\sum{}Q_1\times{}P_1}{\sum{}Q_1\times{}P_0}$

3. Fisher index:
前面两者的几何平均。
$\text{Fisher Index}=\sqrt{I_P\times{}I_L}$

两类 inflation：
1. cost-push inflation: 由成本的增加导致的
2. demand-pull inflation: 由总需求 AD 的增加导致的

## Economic indicator
常考先行指标，给定语言描述和指标变化，判断经济的变化
1. Leading
    1. average weekly intial claims for unemployment insurance：数量增多，经济要变差
    2. interest rate spread between 10-year treasury yields and overnight borrowing rates, 息差越大，经济好，spread 越来越宽

2. Lagging
    1. inventory-sales ratio 存货/销售额比：指标减小，经济复苏

## Monetry policy
央行每发行 1 元，能给市场带来的流动性。
monetary multiplier 货币乘数：
$\frac{1}{r_d}$, where r_d is the reserve ratio 法定准备金储备率。

**Fisher effect**:
名义利率是实际利率和预期通胀率之和。
$R_{nom}=R_{real}+E[I]$

## Tools of the central bank 央行工具
1. Policy rate 政策利率
    1. rate 下降，融资成本低，释放流动性，是扩张
    2. rate 上升，融资成本高，收紧流动性，是紧缩

2. Reserve requirement 存款准备金
    1. 上升，是紧缩
    2. 下降，是扩张

3. Open market operations 公开市场操作
    1. 买债券，钱投入到了市场，市场钱多了，是扩张
    2. 卖债券，钱收回，是紧缩

**Liquidity trap**: 流动性陷阱，央行的钱给了商行，实行扩张的货币政策，但商行没有把钱贷出去，流动性没有增加，政策失效。

## Fiscal policy 财政政策（政府的）
政府多支出 1 元，能给市场带来的流动性。
$\text{fiscal multiplier}=\frac{1}{1-MPC(1-t)}$
b: MPC，边际消费倾向。
如果题目中没给税率 t，就不用放在公式里了。

# 国际
## 比较优势
要知道如何计算比较优势。
相对更强的一方/弱的较小的一方有比较优势。

## BOP
国际贸易的收支表，
1. the current account
    1. 进出口商品&原料
    2. 进出口服务费用
    3. 投资
2. the capital account
3. the financial account

## International organizations
1. Interantional monetary fund (IMF): 国际货币基金组织，解决金融危机的。
2. World Bank Group 世界银行，帮助发展中国家的。
3. World Trade Organizations (WTO) 世贸组织，管贸易的。

## Currency exchange rate
**Nominal and real exchange rate**
要考虑两国的物价水平。
$FX_{real(d/f)}=FX_{nominal(d/f)}\times{}\frac{CPI_f}{CPI_d}$
自己的货币剔除自己的物价水平。

Forward points = forward rate - spot rate.

## Cross rate 交叉汇率
计算三个国家之间的汇率

## 利率平价理论
两个国家间汇率变化近似于量过利率之差

$\frac{F-S}{S}\approx{}r_x-r_y$

## Marshall-Lerner condition
本币贬值能改变贸易赤字吗？
只有当满足 marshall-lerner consdition, 即：
$E_X+E_M>1$ 的时候才可以。

成立的情况下，改变也不是即时的，而是有时滞效应：J-Curve.


















































