
# Taller: Rstudio Aplicado a Finanzas
# Colegio de Economistas de Loreto
# Profesor: Jose Rodney Menezes De la Cruz

#========================================================================
# Sesión 4 "Matematica Financiera Aplicada"
#========================================================================

#=================================================
# I. Instalacion del paquete financiero 
#=================================================

install.packages("FinancialMath")
library(FinancialMath)

#=================================================
# II. Valor temporal del dinero
#=================================================

# Valor temporal del dinero

TVM(pv=10,fv=20,i=.05,ic=2,plot=TRUE)
TVM(pv=50,n=5,i=.04,plot=TRUE)

#=================================================
# III. Rendimiento
#=================================================

# Rendimiento ponderado en dólares

yield.dollar(cf=c(20,10,50),times=c(.25,.5,.75),start=100,end=175,endtime=1)
yield.dollar(cf=c(500,-1000),times=c(3/12,18/12),start=25200,end=25900,endtime=21/12)

#Rendimiento ponderado en el tiempo

yield.time(cf=c(0,200,100,50),bal=c(1000,800,1150,1550,1700))

#=================================================
# Iv. Convertir tasas
#=================================================

# Convertidor de tasas de intereses y descuentos

rate.conv(rate=.05,conv=2,nom=1)
rate.conv(rate=.05,conv=2,nom=4,type="discount")
rate.conv(rate=.05,conv=2,nom=4,type="force")

#=================================================
# v. VAN y TIR
#=================================================

# Valor Presente Neto (VAN)

NPV(cf0=100,cf=c(50,40),times=c(3,5),i=.01)
NPV(cf0=100,cf=50,times=3,i=.05)
NPV(cf0=100,cf=c(50,60,10,20),times=c(1,5,9,9),i=.045)

# Tasa interna de retorno (TIR)

IRR(cf0=1,cf=c(1,2,1),times=c(1,3,4))
IRR(cf0=100,cf=c(1,1,30,40,50,1),times=c(1,1,3,4,5,6),plot=T)

#=================================================
# vI. Bonos
#=================================================

# Análisis de bonos

bond(f=100,r=.04,c=100,n=20,i=.04,ic=1,cf=1,t=1)
bond(f=100,r=.05,c=110,n=10,i=.06,ic=1,cf=2,t=5,plot=T)

#=================================================
# vII. Flujo de caja
#=================================================

# Análisis de flujo de caja

cf.analysis(cf=c(1,1,101),times=c(1,2,3),i=.04,time.d=TRUE)
cf.analysis(cf=c(5,1,5,45,5),times=c(5,4,6,7,5),i=.06,plot=TRUE)

#=================================================
# vIII. Amortizaciones
#=================================================

# Periodo de amortización

amort.period(Loan=100,n=5,i=.01,t=3)
amort.period(n=5,pmt=30,i=.01,t=3,pf=12)
amort.period(Loan=100,pmt=24,ic=1,i=.01,t=3)

# Tabla de amortización

amort.table(Loan=1000,n=2,i=.005,ic=1,pf=1)
amort.table(Loan=100,pmt=40,i=.02,ic=2,pf=2,plot=FALSE)
amort.table(Loan=NA,pmt=102.77,n=10,i=.005,plot=TRUE)

#=================================================
# IX. Anualidades
#=================================================

# Anualidad Aritmética

annuity.arith(pv=NA,fv=NA,n=20,p=100,q=4,i=.03,ic=1,pf=2,imm=TRUE)
annuity.arith(pv=NA,fv=3000,n=20,p=100,q=NA,i=.05,ic=3,pf=2,imm=FALSE,plot=T)

# Anualidad Gerométrica

annuity.geo(pv=NA,fv=100,n=10,p=9,k=.02,i=NA,ic=2,pf=.5,plot=TRUE)
annuity.geo(pv=NA,fv=128,n=5,p=NA,k=.04,i=.03,pf=2)

# Nivel de anualidad

annuity.level(pv=NA,fv=101.85,n=10,pmt=8,i=NA,ic=1,pf=1,imm=TRUE)
annuity.level(pv=80,fv=NA,n=15,pf=2,pmt=NA,i=.01,imm=FALSE)

#=================================================
# X. Perpetuidades
#=================================================

# Perpetuidad Aritmética

perpetuity.arith(100,p=1,q=.5,i=NA,ic=1,pf=1,imm=TRUE)
perpetuity.arith(pv=NA,p=1,q=.5,i=.07,ic=1,pf=1,imm=TRUE)
perpetuity.arith(pv=100,p=NA,q=1,i=.05,ic=.5,pf=1,imm=FALSE)


# Perpetuidad Geométrica

perpetuity.geo(pv=NA,p=5,k=.03,i=.04,ic=1,pf=1,imm=TRUE)
perpetuity.geo(pv=1000,p=5,k=NA,i=.04,ic=1,pf=1,imm=FALSE)


# Nivel de perpetuidad

perpetuity.level(pv=100,pmt=NA,i=.05,ic=1,pf=2,imm=TRUE)
perpetuity.level(pv=100,pmt=NA,i=.05,ic=1,pf=2,imm=FALSE)



#Intercambio de tasa de interés

swap.rate(rates=c(.04, .05, .06), type = "spot_rate")
swap.rate(rates=c(.93,.95,.98,.90), type = "zcb_price")


# Intercambio de productos

swap.commodity(prices=c(103,106,108), rates=c(.04,.05,.06))
swap.commodity(prices=c(103,106,108), rates=c(.9615,.907,.8396),type="zcb_price")
swap.commodity(prices=c(105,105,105), rates=c(.85,.89,.80),type="zcb_price")

#=================================================
# XII. Precios de acciones
#=================================================

# Bear Call Spread

bear.call(S=100,K1=70,K2=130,r=.03,t=1,price1=20,price2=10,plot=TRUE)

# Bear Call Spread - Black Scholes

bear.call.bls(S=100,K1=70,K2=130,r=.03,t=1,sd=.2,plot=T)

# Bull Call Spread

bull.call(S=115,K1=100,K2=145,r=.03,t=1,price1=20,price2=10,plot=TRUE)
bull.call.bls(S=115,K1=100,K2=145,r=.03,t=1,sd=.2

# Butter???y Spread

butterfly.spread(S=100,K1=75,K2=100,K3=125,r=.03,t=1,price1=25,price2=10,price3=5,plot=T)
butterfly.spread.bls(S=100,K1=75,K2=100,K3=125,r=.03,t=1,sd=.2,plot=T)

# Collar Strategy

collar(S=100,K1=90,K2=110,r=.05,t=1,price1=5,price2=15,plot=TRUE)

# Covered Call

covered.call(S=100,K=110,r=.03,t=1,sd=.2,plot=TRUE)

# Covered Put

covered.put(S=100,K=110,r=.03,t=1,sd=.2,plot=TRUE)

# Call Option

option.call(S=100,K=110,r=.03,t=1.5,sd=.2,price=NA,position="short")
option.call(S=100,K=100,r=.03,t=1,sd=.2,price=10,position="long")

# Put Option

option.put(S=100,K=110,r=.03,t=1,sd=.2,price=NA,position="short")
option.put(S=100,K=110,r=.03,t=1,sd=.2,price=NA,position="long")

# Protective Put

protective.put(S=100,K=100,r=.03,t=1,sd=.2)
protective.put(S=100,K=90,r=.01,t=.5,sd=.1)

#=================================================
# XIII. Contratos Forward
#=================================================

# Contrato Forward

forward(S=100,t=2,r=.03,position="short",div.structure="none")
forward(S=100,t=2,r=.03,position="long",div.structure="discrete",dividend=3,k=.02)
forward(S=100,t=1,r=.03,position="long",div.structure="continuous",D=.01)


# Contrato prepago Forward

forward.prepaid(S=100,t=2,r=.04,position="short",div.structure="none")
forward.prepaid(S=100,t=2,r=.03,position="long",div.structure="discrete",
                dividend=3,k=.02,df=2)
forward.prepaid(S=100,t=1,r=.05,position="long",div.structure="continuous",D=.06)



#======================================================================================#

############################ Fin sesion 4 ####################################}

#======================================================================================#