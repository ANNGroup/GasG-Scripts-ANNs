% Name of code: Script_ANN38
% Developer and contact address: A. Acevedo-Anicasio and Instituto de 
% Energias Renovables, Universidad Nacional Autonoma de Mexico; Priv. 
% Xochicalco s/n, Temixco, 62580
% Morelos, Mexico
% Telephone number: Tel.: +52 (55) 5622-9774, Fax: +52 (55)5622-9791
% e-mail: esg@ier.unam.mx

% Year first available: 2018
% Suggested hardware: Intel Core Processor i5-2300, 2.80GHz, Ram Memory 
% 4 GB, and  a Hard drive 500 GB
% Software requirements: Matlab for Windows v. R2017b (MathWorks, 2017)
% Programming language: MATLAB
% Programming file size: 25 kB with 386 lines of code

clear all
close all
clc

%target: BHT (°C) 
t = [275	270	320	327	330	330	324	340	300	325	300	215	182	240	240	278	250	250	260	260	240	260	260	270	250	250	240	240	240	250	250	230	260	240	250	240	240	250	240	240	250	250	260	250	240	270	212	238	217	338	343	325	281	293	304	279	300	292	296	280	306	287	314	315	271	287	271	277	302	248	278	302	265	276	267	267	262	274	352	311	296	301	281	327	329	204	356	319	267	262	330	300	350	322	340	284	307];

%inputs: ln(CO2), ln(H2S), ln(CH4), ln(H2) mmol/mol
p = [6.7400643334	6.7190644444	6.7813022227	6.7138309735	6.7207836672	6.7682163269	6.7226210536	6.6904141291	6.8339414522	6.6942300686	6.7401922489	6.7464586998	6.7572894181	6.8440497794	6.8161532856	6.6862770070	6.8471556569	6.8453478189	6.8647433884	6.8411880347	6.8633853312	6.8450284491	6.8433234188	6.8335703808	6.8381908156	6.8743019027	6.8802813020	6.8806923594	6.8779144370	6.8878586473	6.8884705176	6.8795615446	6.8586700713	6.8800757099	6.8433234188	6.8652652274	6.8467305771	6.8446024640	6.8609780874	6.8561461452	6.8589851146	6.8726461019	6.8409742453	6.8499142793	6.8328161923	6.8512907420	6.7464121286	6.7226297949	6.7417006947	6.7611001532	6.8070121486	6.7126523878	6.7613991426	6.7440591863	6.7465687947	6.7743953002	6.7451186955	6.7306600412	6.7433129323	6.7093043403	6.7652119722	6.7465296305	6.7331637683	6.7411692666	6.8680427710	6.7954594201	6.8948427510	6.8171326620	6.8696538074	6.8390822448	6.8925374675	6.8028771610	6.8718437543	6.8704690099	6.8916258971	6.8846069350	6.8745882130	6.8608392058	6.8659684353	6.8267350103	6.8781235868	6.8329901362	6.8620928941	6.8019896344	6.8246783338	6.8832255243	6.8061551193	6.7425056300	6.8014665170	6.8578820285	6.7846913509	6.7238816419	6.7791232751	6.7801491544	6.8107682592	6.8519239318	6.7742238864
4.1713998013	4.6292601156	4.3387959390	4.5877023179	4.4276177961	4.2017733172	4.4426987320	4.7932941442	3.6950128408	3.8051707699	4.1914962416	4.6772100228	4.7749655579	2.6603611721	3.4660882584	4.9713553199	2.9496883351	3.0056826044	2.6246685922	2.6946271808	2.6173958328	2.9806186357	2.9856819377	3.2503744919	3.1527360224	2.3025850930	2.1633230257	2.1517622033	2.3795461341	1.6292405397	1.5260563035	2.3321438952	3.0056826044	2.2192034841	2.9907197317	2.3025850930	3.0106208860	3.0397491590	2.5572273114	2.8791984573	2.7408400239	2.2823823857	3.1267605360	2.8273136219	3.1179499063	2.9123506646	4.0073331852	4.7004803658	4.4998096703	4.5029668228	2.0082208506	4.0289167569	3.9665111907	3.7248898916	4.0976723523	3.7376696183	4.0764068615	4.2199977811	3.9883665720	4.0678865033	3.6750340473	3.9441674588	4.0342406382	3.9598603348	3.2016676592	2.0915994764	1.7995261305	4.1065228823	3.0565104671	3.4114005518	1.8857909151	4.0522187119	2.1882684070	2.8851982573	2.2721258855	2.4864985446	3.1039790051	2.7325058100	3.2798748745	3.9049883199	2.7729198632	3.7545280007	3.2624876254	4.0048650956	3.9488905246	2.5816615809	3.9329209744	4.6097835620	4.0277396088	3.4640156741	4.2163145500	4.4726656545	4.4776248469	4.4169110365	4.2179698291	3.5758938262	4.4998096703
1.7670320140	-0.0404485915	-0.0065491290	-1.2288207797	-0.7810874117	-1.0230768975	-0.3421379742	-1.9546124338	-0.9693903518	-0.0189278410	0.5784639913	1.7347091995	0.6554768139	-0.7188573029	-0.3708442956	-0.0454623741	2.6532419646	2.5802168296	1.9315214116	2.9601050959	2.1747517215	2.7212954279	2.7212954279	2.6246685922	2.5257286443	1.4586150227	1.2809338455	1.1939224685	1.1631508098	0.9555114450	1.0986122887	0.6418538862	1.4350845253	1.0986122887	2.6173958328	2.4849066498	2.3223877203	2.1633230257	2.2721258855	2.1162555148	2.2721258855	1.8562979904	2.4069451083	2.4595888418	2.8213788864	2.1972245773	2.0794415417	2.4849066498	2.0412203289	0.6743254263	1.9617008350	3.7037680666	3.5424075502	3.6506582413	3.6073078004	3.3087165289	3.5844444360	3.6375861597	3.5657697570	3.9066753991	3.6571307558	3.7240857098	3.7352858269	3.5751506888	-0.1528930654	-1.4951530518	-0.6529675043	-0.7937044356	-0.9768877642	-0.0032475175	0.3032421651	-0.3140494871	-0.2724698178	-0.3403554626	-1.4696759701	-0.8067979284	-0.0343776995	-1.3275036269	-0.4000782434	-0.7370990681	-0.1732321962	0.6150679565	-0.3887507741	0.3190500987	-0.1027712780	-0.3384878221	2.7893132941	3.0188404641	2.6247601459	-0.9808292530	2.8527183059	3.5416130234	-0.0532680851	0.9030028375	0.3704294865	0.2665425489	3.2530839962
1.6735059560	4.1158269285	3.6196732720	4.3049102307	4.3990897125	4.1443510859	4.4223642504	4.2229543929	3.3607834088	4.0532948042	4.0267288838	1.2812896982	2.9284614371	0.4631365947	-0.6946313727	2.7415566130	2.9755295662	3.0252910758	2.7278528284	2.8678989020	2.6532419646	2.8735646396	2.8449093838	3.2148678035	3.1780538303	2.7788192720	2.5952547070	2.5726122302	2.6390573296	2.3702437415	2.2823823857	2.7013612130	3.0955776085	2.6246685922	2.9856819377	2.3223877203	3.1398326175	3.3250360207	2.8273136219	2.9755295662	2.8390784635	2.6672282066	3.2425923515	3.0349529867	3.2228678461	3.1045866785	-0.9162907319	-0.1053605157	-0.5108256238	3.2000540706	0.5266163097	4.0569887757	3.0228609409	3.9614478888	3.3510729945	3.6454498962	3.2908863608	3.5292973843	3.5862928653	3.8992754326	3.4531571206	2.9856819377	3.6519561000	3.7244878816	1.5845611393	1.9855722875	-0.0454250425	2.2940823805	1.7704252057	1.9185953668	0.1254534096	2.7511139080	1.0494899912	1.9219355967	0.7884573604	1.2434013420	0.7994146773	1.5893673025	1.3486252037	1.8849461840	1.2766176565	1.7353662714	1.5398508930	2.3181972319	1.8857219399	0.7839495751	2.7049480722	2.6216381402	2.9122275357	1.3904108766	2.4964789978	3.0449211487	2.4447033614	3.0282478652	2.3400185709	1.9548290760	3.2084213670];

%assignment of columns and rows
[inputs,Rows] = size(p);

%normalization between -1 and 1
[pn,ps] = mapminmax(p);
[tn,ts] = mapminmax(t);

%index creation for training, validation and testing
p1 = 1:5:Rows;
p2 = 2:10:Rows;
p3 = 3:5:Rows;
p4 = 4:10:Rows;
p5 = 5:5:Rows;
p7 = 7:10:Rows;
p9 = 9:10:Rows;

%percentage assignment for: training(80%), validation(10%) and testing(10%)
aa = [p1 p3 p5 p7 p9];
vv = [p2];
tt = [p4];

%Creation of training, validation and testing vectors
val.P = pn(:,vv); val.T = tn(:,vv);
test.P = pn(:,tt); test.T = tn(:,tt);
trainP = pn(:,aa); trainT = tn(:,aa);

%initial parameters
hiddenNeurons = 1;
maxHiddenNeurons = 35;
iterations = 1000;
targetIdeal = 0.99;
flagHiddenNeurons = 1;
learningRate = 0.01;
lrOption= 1 ;

%cycle that controls the number of hidden neurons
while(hiddenNeurons <= maxHiddenNeurons & flagHiddenNeurons == 1)

    %cycle that controls the inicialized learning rate (0.01, 0.001, 0.0001, 0.00001)
    while (lrOption <= 4)
        flagLearningRate = 1;
        rInitial = 0.1;        
        n = 1;       
        rCalculated = [];        
        
        %cycle that creates the ANN
        while (flagLearningRate == 1)
            net = newff(minmax(pn(:,aa)),[hiddenNeurons 1],{'tansig' 'purelin'},'trainlm');            
            net.trainParam.mu = learningRate;
            net.trainParam.epochs = 3000;
            net.trainParam.goal = 1e-6;
            
            [net,tr] = train(net,trainP,trainT,[],[],val,test);
            a = sim(net,pn);
            [m,b,r] = postreg(a,tn);          
            rCalculated(n) = r;                       
            
            if (r > rInitial)
                rInitial = r;
                slope = m;
                intercept = b;
                
                %denormalize output of the ANN
                for i=1:length(t)                    
                    outputANN(i) = ( ((a(i)+1)/2)*(max(t)-min(t)) )+min(t);
                end                

                %calculate the correlation coefficient r for Global set
                aMean = mean(outputANN);
                tMean = mean(t);                               
                for i=1:length(t)
                    t_tMean(i) = (t(i)-tMean).^2;               
                    a_aMean(i) = (outputANN(i)-aMean).^2;                    
                    t_tMean_a_aMean(i) = (t(i)-tMean)*(outputANN(i)-aMean);
                end                
                rGlobal = (sum(t_tMean_a_aMean))/sqrt((sum(t_tMean))*(sum(a_aMean)));
                
                %calculate the correlation coefficient r for training set
                aMeanTrain = mean(outputANN(:,(aa)));
                tMeanTrain = mean(t(:,(aa)));                
                for i=1:length(t)
                    t_tMeanTrain(i) = (t(i)-tMeanTrain).^2;               
                    a_aMeanTrain(i) = (outputANN(i)-aMeanTrain).^2;                    
                    t_tMeanTrain_a_aMeanTrain(i) = (t(i)-tMeanTrain)*(outputANN(i)-aMeanTrain);
                end
                rTrain = (sum(t_tMeanTrain_a_aMeanTrain(:,aa)))/sqrt((sum(t_tMeanTrain(:,aa)))*(sum(a_aMeanTrain(:,aa))));
                                
                %calculate the correlation coefficient r for validation set                
                aMeanVal = mean(outputANN(:,(vv)));
                tMeanVal = mean(t(:,(vv)));                
                for i=1:length(t)
                    t_tMeanVal(i) = (t(i)-tMeanVal).^2;               
                    a_aMeanVal(i) = (outputANN(i)-aMeanVal).^2;                    
                    t_tMeanVal_a_aMeanVal(i) = (t(i)-tMeanVal)*(outputANN(i)-aMeanVal);
                end
                rVal = (sum(t_tMeanVal_a_aMeanVal(:,vv)))/sqrt((sum(t_tMeanVal(:,vv)))*(sum(a_aMeanVal(:,vv))));
                
                %calculate the correlation coefficient r for testing set
                aMeanTest = mean(outputANN(:,(tt)));
                tMeanTest = mean(t(:,(tt)));                
                for i=1:length(t)
                    t_tMeanTest(i) = (t(i)-tMeanTest).^2;               
                    a_aMeanTest(i) = (outputANN(i)-aMeanTest).^2;                    
                    t_tMeanTest_a_aMeanTest(i) = (t(i)-tMeanTest)*(outputANN(i)-aMeanTest);
                end
                rTest = (sum(t_tMeanTest_a_aMeanTest(:,tt)))/sqrt((sum(t_tMeanTest(:,tt)))*(sum(a_aMeanTest(:,tt))));
            
                %calculate the RMSE global
                for i=1:length(t)
                    tmpDifference(i)=(t(i)-outputANN(i));
                end
                tmp1=tmpDifference.^2;
                tmp2=sum(tmp1);
                rmse=sqrt(tmp2/length(t));
                
                %calculate the MAE global
                for i=1:length(t)
                    errorAbs(i)=abs(t(i)-outputANN(i));                    
                end
                mae=(sum(errorAbs))/(length(t));
                                    
                %Relative contribution - Garson algorithm 1991                
                contribution=[];
                c=[];
                R=[];
                S=[];                
               
                for mm=1:hiddenNeurons        
                    for k=1:inputs
                        c(mm,k)=net.IW{1,1}(mm,k)*net.LW{2,1}(1,mm);
                    end
                end                
               
                for mm=1:hiddenNeurons
                    for k=1:inputs
                        R(mm,k)=abs(c(mm,k))/(abs(c(mm,1))+abs(c(mm,2))+abs(c(mm,3))+abs(c(mm,4)));
                    end
                end
                
                %different cases for the number of hidden neurons                
                switch hiddenNeurons
                    case 1                        
                        for k=1:inputs
                            S(k)=R(1,k);
                        end
                    case 2                        
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k);
                        end
                    case 3                        
                        for k=1:inputs 
                            S(k)=R(1,k)+R(2,k)+R(3,k);
                        end
                    case 4                        
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k);
                        end                      
                    case 5                        
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k);
                        end
                    case 6
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k);
                        end
                    case 7
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k);
                        end
                    case 8
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k);
                        end
                    case 9
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k);
                        end
                    case 10
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k);
                        end
                    case 11
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k);
                        end
                    case 12
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k);
                        end
                    case 13
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k);
                        end
                    case 14
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k);
                        end
                    case 15
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k);
                        end                        
                    case 16
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k);
                        end
                    case 17
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k);
                        end
                    case 18
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k);
                        end
                    case 19
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k);
                        end
                    case 20
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k);
                        end
                    case 21
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k);
                        end
                    case 22
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k);
                        end
                    case 23
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k);
                        end
                    case 24
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k);
                        end
                    case 25
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k);
                        end
                    case 26
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k);
                        end
                    case 27
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k);
                        end
                    case 28
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k);
                        end
                    case 29
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k);
                        end
                    case 30
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k);
                        end
                    case 31
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k)+R(31,k);
                        end
                    case 32
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k)+R(31,k)+R(32,k);
                        end
                    case 33
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k)+R(31,k)+R(32,k)+R(33,k);
                        end
                    case 34
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k)+R(31,k)+R(32,k)+R(33,k)+R(34,k);
                        end                                                                                
                    case 35
                        for k=1:inputs
                            S(k)=R(1,k)+R(2,k)+R(3,k)+R(4,k)+R(5,k)+R(6,k)+R(7,k)+R(8,k)+R(9,k)+R(10,k)+R(11,k)+R(12,k)+R(13,k)+R(14,k)+R(15,k)+R(16,k)+R(17,k)+R(18,k)+R(19,k)+R(20,k)+R(21,k)+R(22,k)+R(23,k)+R(24,k)+R(25,k)+R(26,k)+R(27,k)+R(28,k)+R(29,k)+R(30,k)+R(31,k)+R(32,k)+R(33,k)+R(34,k)+R(35,k);
                        end    
                    otherwise
                        disp('option not found')
                end
                
                % contribution of each input    
                for k=1:inputs
                    contribution(k)=S(k)/(S(1)+S(2)+S(3)+S(4));
                end
                
                %saving weights of the ANN in txt files
                bestIteration=n;
                IW=net.IW{1,1};
                lw=net.LW{2,1};
                LW=lw';
                b1=net.b{1};
                b2=net.b{2};                
                filename1 = [num2str(hiddenNeurons),'_neurons_lr_',num2str(learningRate),'_IW','.txt'];
                filename2 = [num2str(hiddenNeurons),'_neurons_lr_',num2str(learningRate),'_b1','.txt'];
                filename3 = [num2str(hiddenNeurons),'_neurons_lr_',num2str(learningRate),'_LW','.txt'];
                filename4 = [num2str(hiddenNeurons),'_neurons_lr_',num2str(learningRate),'_b2','.txt'];              
                save(filename1,'IW','-ascii');
                save(filename2,'b1','-ascii');
                save(filename3,'LW','-ascii');
                save(filename4,'b2','-ascii');                
     
            end %end of if (r > rInitial)
            
            %if the ideal target is reached or all the iterations are executed
            if (r >= targetIdeal || n == iterations)
              flagLearningRate = 0;
            else              
              n = n+1
            end
        
        end % end of while (flagLearningRate == 1)
        
        %for report in txt        
        rMin = min(rCalculated);
        rSort = sort(rCalculated);
        rMedian = median(rSort);        
        input1 = contribution(1);
        input2 = contribution(2);
        input3 = contribution(3);
        input4 = contribution(4);
       
        %creation of results vector
        results = [inputs, hiddenNeurons, iterations, learningRate, rMin, rMedian, rGlobal, rTrain, rVal, rTest, rmse, mae, slope, intercept, input1, input2, input3, input4, bestIteration];
        
        %save in file txt        
        dlmwrite('report_ANN38.txt',results,'-append','delimiter',',','newline','unix');
        results = [];
                
        %different cases for learning rate
        switch(lrOption)
            case 1
                learningRate = 0.001;
                lrOption = lrOption+1;                
            case 2
                learningRate = 0.0001;
                lrOption = lrOption+1;
            case 3
                learningRate = 0.00001;
                lrOption = lrOption+1;
            case 4
                lrOption = lrOption+1;
            otherwise
                disp('option not found')
        end %end switch(lrOption)           
        
    end %end of while (lrOption <= 4)
    
    %we reset parameters for the next hidden neuron
    hiddenNeurons = hiddenNeurons+1;
    lrOption = 1;
    learningRate = 0.01;

end %end of while(hiddenNeurons <= maxHiddenNeurons & flagHiddenNeurons == 1)