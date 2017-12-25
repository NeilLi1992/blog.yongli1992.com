title: CFA Notes - Quantitive Methods
date: 2017-12-07 20:52:11
tags:
	- cfa
	- finance
categories:
	- finance
---

**Decompose required rate of return**
interest rate = nominal risk-free rate + risk premium
nominal risk-free rate = real risk-free rate + expected inflation rate

## 收益率计算
**HPR**
Total return between purchase date and sale/maturity date.
$\text{HPR}=\frac{P_1-P_0+D_1}{P_0}$，有时也叫 HPY，也会按 $\text{HPY}=\frac{FV-PV}{PV}$ 来计算。

money market yield: $r_{MM}=\text{HPY}\times{}\frac{360}{t}$

bank discount rate: $r_{BD}=\text{HPY}\times{}\frac{360}{t}$

$(1+\frac{BEY}{2})^2=1+EAY=(1+HPY)^{\frac{365}{t}}$

单利年化用 360，复利年化用 365.

**TWRR & MWRR**
如果 HPR 是年度的或者大于一年的：
$TWRR=\sqrt{\sum^n_{i=1}(1+HPR_i)}-1$

如果 HPR 是季度/月度或小于一年的：
$TWRR=\sum^n_{i=1}(1+HPR_i)-1$

MWRR 就是用计算器按年金计算 I/Y。

## Measures of Mean
Arithmetic
$\overline{X_A}=\frac{\sum^n_{i=1}X_i}{n}$

Weighted
$\overline{X_W}=\sum^n_{i=1}w_iX_i$

Geometric
$\overline{X_G}=(\Pi^n_{i=1}X_i)^{1/n}$

Harmonic
$\overline{X_H}=\frac{n}{\sum^n_{i=1}(1/X_i)}$

Geometric mean of past annual return is the appropriate measure of past performance.

Arithmetic mean is statistically the best estimator of the next year's returns.

## Quantiles
Mean: 50%
Quartile: 25%
Quintile: 20%
Decile: 10%
Percentile: 1%

$L_y=\frac{(n+1)y}{100}$

## Dispersion
Range: highest level - lowest level

$\text{MAD}=\frac{\sum^N_{i=1}|X_i-\mu|}{N}$

For population variance:
$\sigma^2=\frac{\sum^N_{i=1}(X_i-\mu)}{N}$

For sapmle variance:
$S^2=\frac{\sum^n_{i=1}(X_i-\overline{X})}{n}$

结论：
1. variance 比 MAD 好，因为 variance 是连续，处处可导的。
2. $\text{MAD}\leq{}\sigma$


## Chebyshev's Inequality
For either sample or population, the proportion of the values that lie within k standard deviations of teh mean is:

$P(|X-\mu|\leq{}k\sigma)\geq1-\frac{1}{k^2}$

Apply regardless of the shape/distribution.

## Coefficent of variance and sharp ratio
$\text{CV}=\frac{S_X}{\overline{X}}\times{}100\%$

Sharp ratio measures excess return per unit of risk.
$\text{Sharp ratio}=\frac{R_P-R_f}{\sigma_P}$

只能用于 rank，没有实在含义，当小于零时可能会得到错误的结论。

## Skewness and Kurtosis
![](https://i.imgur.com/uDburms.png)
Positivly skewed: 长尾在右，mean > median > mode
Negatively skewed: 长尾在左，mean < median < mode

计算 skewness 时是三阶的。
Investors should be attracted to a postive skewness.

**Kurtosis**
Leptokurtic: k > 3
Normal: k = 3
Platykurtic: k < 3

计算 kurtosis 时是四阶的。

normal distribution 是 skewness=0，kurtosis=3.

## Probability
x rule
$P(AB)=P(B)\times{}P(A|B)$

\+ rule
$P(\text{A or B})=P(A)+P(B)-P(AB)$

Mutually exclusive events
$P(AB)=0$
$P(\text{A or B})=P(A)+P(B)$

Independent events:
$P(A|B)=P(A)$
$P(B|A)=P(B)$
$P(AB)=P(A)\times{}P(B)$

不独立未必互斥，互斥一定不独立。

**Odds**
Odds for an event E:
$\frac{P(E)}{1-P(E)}$

Odds agains an event E:
$\frac{1-P(E)}{P(E)}$

**Expected value E(X)**
$\sum{}^n_{i=1}P(X_i)X_i$

**Variance**
$\sigma^2(x)=\sum^n_{i=1}[X_i-E(x_i)]^2$

**Covariance**
$Cov(X,Y)=E[(X-E(X))(Y-E(Y))]$
range from negative inf to positive inf.

Covariance of random variable X with itself is its variance.

**Correlation**
$\rho=\frac{Cov(A,B)}{\sigma_{A}\sigma_{B}}$
range from -1 to 1.

If 1, two variables are perfectly positive linear correlated.
If -1, two variables are perfectly negative lienar correlated.
If 0, no linear correlation.

**Baye's formula**
$P(A|B)=\frac{P(B|A)}{P(B)}\times{}P(A)$
we can update a given set of prior probabilities for a given event in response to the arrival of new information.

## Counting
**Labeling (or multinomial)**
$\frac{n!}{n_1!\times{}n_2!\times{}...\times{}n_k!}$

**Combination**
$C_n^r=\frac{n!}{(n-r)!\times{}r!}$

**Permutation**
$P_n^r=\frac{n!}{(n-r)!}$

## Discrete random distribution
**Discrete uniform random variable**
The probablities for all possible outcomes for a discrete random variable are equal.

**Bernoulli random variable**
只做一次实验，只有两种结果（1=成功，0=失败）
$p(1)=P(X=1)=p$
$p(0)=P(X=0)=1-p$

**Binomial random variable**
做 n 次实验，随机变量为成功 X 次
$P(X)=C_n^xp^x(1-p)^{n-x}$

## Continuous random distribution
Defined over a range that spans between some lower limit a and a upper limit b, which serve as the parameters of the distribution.

$P(\text{X < a or X > b})=0$

For all $a\leq{}x_1\lt{}x_2\leq{}b$,
$P(x_1\leq{}X\leq{}x_2)=\frac{x_2-x_1}{b-a}$

## Normal distribution
1. $X\sim{}N(\mu, \sigma^2)$
2. skewness = 0, kurtosis = 3
3. linear combination fo normally distributed random variables is also normall distributed

**Confidence intervals**
68%: $[\mu-\sigma,\mu+\sigma]$
90%: $[\mu-1.65\sigma,\mu+1.65\sigma]$
95%: $[\mu-1.96\sigma,\mu+1.96\sigma]$
99%: $[\mu-2.58\sigma,\mu+2.58\sigma]$

**Standardization**
If $X\sim{}N(\mu, \sigma^2)$
Then $Z=\frac{X-\mu}{\sigma}\sim{}N(0, 1)$

**lognormal distribution**
If $ln(x)\sim{}N$, the nX is lognormal.
Useful to describe price of asset, because bounded below by zero.
Right skewed (positvely).

## Safety First Ratio
$SFR=\frac{E(R_p)-R_L}{\sigma_p}$, the bigger the better.

Optimal portfolio minimizes the probablity taht return of portfolio falls below some minimum acceptable level (R_L).

与 sharpe ratio 的区别:
$\text{Share ratio}=\frac{E(R_p)-R_f}{\sigma_p}$
Sharpe ratio is a special case when $r_L=r_f$.

---
**Time-series data**
Observations taken over a period of time at specific and equally spaced time intervals.

**Cross-sectional data**
A sample of observations taken at a single point in time.

## Central limit theorem
Sampling distribution of the sample mean $\overline{X}$ approaches a normal distribution as sample size becomes large (>30).

结论：
1. Mean of sample mean equals population mean: $\overline{X}=\mu$
2. Variance of sample mean equals population variance divided by sample size: $\frac{\sigma^2}{n}$

**Standard error of sample mean 标准误计算**
If known population variance, $stderr=\frac{\sigma}{\sqrt{n}}$
If unknown population variance, $stderr=\frac{s}{\sqrt{n}}$

## Student's t-distribution
Symetrical
Degree of freedom: n-1
Less peaked than normal distribution (fatter tails).
DoF 增大，逐渐逼近 normal distribution.

## Estimation
Estimation 研究如何用样本均值 $\overline{X}$ 来估计总体均值 $\mu$.

**Desirable properties of estimators**
1. unbiasedness
2. efficiency
3. consistency

**Point Estimation**
样本结果是多少就认为总体结果是多少，属于*不科学的估计方法*。

**Confidence Interval Estimation 置信区间估计**
给出估计总体的 $\mu$ 值有多少概率可以落在一个区间内，更科学。

**Concepts**
1. level of significance: $\alpha$ 显著性水平，小概率事件的可能性
2. degree of confidence: $1-\alpha$ 置信度，大概率事件的可能性（正太分布中间大的面积）
3. confidence interval: [point estimate +- (reliability factor) x standard error]
    1. point estimate 就是样本均值 $\overline{X}$.
    2. k 就是根据需要多大的置信区间，来决定的系数
    3. standard error 如果知道总体方差就是 $\frac{\sigma}{\sqrt{n}}$，如果不知道就是 $\frac{s}{\sqrt{n}}$

confidence level 简写为 $[\overline{X}\pm{}k\frac{\sigma}{\sqrt{n}}]$

## Hypothesis Testing
1. Define Hypothesis for population parameter
    假设都是针对总体的，针对样本没有假设可言。
    
    1. Null hyposis 零假设
        $H_0: \mu=\mu_0$
        Null hypois is what we suspect about population, and want to reject.
        
    2. Alternative hyposis 备择假设
        $H_\alpha:\mu\neq\mu_0$
        We want this to be true.
        
        怀疑什么就设为零假设。
        
2. 单双尾
    1. Two-tailed
        $H_0: \mu=\mu_0$
        $H_\alpha: \mu\neq\mu_0$
        
    2. One-taileed
        $H_0: \mu\leq\mu_0$ or $H_0: \mu\geq\mu_0$
        $H_\alpha: \mu\gt\mu_0$ or $H_\alpha: \mu\lt\mu_0$
        等号总是放在零假设（原假设）中。

3. Decide critical value k
Critical value k is solely determined by the significance level (显著性水平，小概率事件发生概率)，k 的作用是划定了拒绝域。

10% 双尾和 5% 单尾是一样的。

4. Test statistic 检验统计量
    $\text{test statistic}=\frac{\text{sample statistic}-\text{hypothesized value}}{\text{standard error of the sample statistic}}$
    
    如果假设是关于 mean 的，则为 $\frac{\overline{X}-\mu_0}{\mu/\sqrt{n}}$ 或 $\frac{\overline{X}-\mu_0}{s/\sqrt{n}}$，取决于总体方差是否已知。
    
---
### p-value method
上面的方法叫做 **critival value method**。
还有另一种检验方法叫做 **p-value method**。

p-value is the smallest level of significance at which the null hypothesis can be rejected.

1. If $\alpha>p$,reject H_0.
2. If $\alpha<p$, fail to reject H_0.

### Type I error and Type II error.
1. Type I error: reject a correct hypothesis
2. Type II error: fail to reject a wrong hypothesis（取伪）

Type II 更危险。

* significance level = P(Type I error)
* power of test = 1 - P(Type II error)

只要增加样本容量可以减少 both errors。

## Technical Analysis
1. Illiquid market can not use technical analysis 非流动性市场不能使用技术分析。
2. EMH 有效市场假说不成立，否则在 weak-form 情形下，TA 也应无效。