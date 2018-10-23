% Name of code: Script_ANN33
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
% Programming file size: 24 kB with 384 lines of code

clear all
close all
clc

%target: BHT (°C) 
t = [275	270	320	327	330	330	324	340	300	325	300	215	182	240	240	278	250	250	260	260	240	260	260	270	250	250	240	240	240	250	250	230	260	240	250	240	240	250	240	240	250	250	260	250	240	270	212	238	217	338	343	325	281	293	304	279	300	292	296	280	306	287	314	315	271	287	271	277	302	248	278	302	265	276	267	267	262	274	352	311	296	301	281	327	329	204	356	319	267	262	330	300	350	322	340	284	307];

%inputs: ln(H2S/CO2), ln(CH4/CO2), ln(H2/CO2) mmol/mol
p = [-2.5686645320	-2.0898043287	-2.4425062837	-2.1261286557	-2.2931658711	-2.5664430097	-2.2799223217	-1.8971199849	-3.1389286115	-2.8890592987	-2.5486960074	-2.0692486770	-1.9823238603	-4.1836886074	-3.3500650272	-1.7149216871	-3.8974673218	-3.8396652144	-4.2400747962	-4.1465608539	-4.2459894984	-3.8644098133	-3.8576414811	-3.5831958889	-3.6854547932	-4.5717168097	-4.7169582763	-4.7289301562	-4.4983683028	-5.2586181075	-5.3624142141	-4.5474176494	-3.8529874669	-4.6608722258	-3.8526036871	-4.5626801344	-3.8361096911	-3.8048533050	-4.3037507761	-3.9769476880	-4.1181450907	-4.5902637162	-3.7142137093	-4.0226006574	-3.7148662860	-3.9389400774	-2.7390789433	-2.0221494291	-2.2418910243	-2.2581333304	-4.7987912980	-2.6837356309	-2.7948879519	-3.0191692947	-2.6488964424	-3.0367256820	-2.6687118340	-2.5106622600	-2.7549463603	-2.6414178370	-3.0901779249	-2.8023621717	-2.6989231301	-2.7813089317	-3.6663751118	-4.7038599437	-5.0953166205	-2.7106097797	-3.8131433403	-3.4276816929	-5.0067465524	-2.7506584491	-4.6835753473	-3.9852707527	-4.6195000115	-4.3981083904	-3.7706092079	-4.1283333958	-3.5860935609	-2.9217466904	-4.1052037235	-3.0784621354	-3.5996052687	-2.7971245388	-2.8757878091	-4.3015639434	-2.8732341448	-2.1327220680	-2.7737269082	-3.3938663544	-2.5683768009	-2.2512159874	-2.3014984283	-2.3632381178	-2.5927984301	-3.2760301056	-2.2744142160
-4.9730323193	-6.7595130358	-6.7878513518	-7.9426517533	-7.5018710789	-7.7912932244	-7.0647590278	-8.6450265629	-7.8033318041	-6.7131579096	-6.1617282576	-5.0117495003	-6.1018126043	-7.5629070823	-7.1869975812	-6.7317393811	-4.1939136922	-4.2651309893	-4.9332219768	-3.8810829388	-4.6886336098	-4.1237330212	-4.1220279910	-4.2089017886	-4.3124621713	-5.4156868800	-5.5993474565	-5.6867698910	-5.7147636272	-5.9323472022	-5.7898582289	-6.2377076584	-5.4235855460	-5.7814634212	-4.2259275860	-4.3803585776	-4.5243428569	-4.6812794383	-4.5888522019	-4.7398906304	-4.5868592291	-5.0163481115	-4.4340291370	-4.3903254375	-4.0114373059	-4.6540661647	-4.6669705869	-4.2377231451	-4.7004803658	-6.0867747269	-4.8453113137	-3.0088843212	-3.2189915924	-3.0934009450	-3.1392609943	-3.4656787714	-3.1606742595	-3.0930738814	-3.1775431753	-2.8026289412	-3.1080812164	-3.0224439206	-2.9978779413	-3.1660185778	-7.0209358364	-8.2906124719	-7.5478102552	-7.6108370976	-7.8465415716	-6.8423297622	-6.5892953024	-7.1169266481	-7.1443135720	-7.2108244725	-8.3613018671	-7.6914048634	-6.9089659125	-8.1883428327	-7.2660466787	-7.5638340784	-7.0513557829	-6.2179221797	-7.2508436682	-6.4829395357	-6.9274496118	-7.2217133464	-4.0168418252	-3.7236651659	-4.1767063710	-7.8387112815	-3.9319730449	-3.1822686185	-6.8323913602	-5.8771463168	-6.4403387727	-6.5853813829	-3.5211398902
-5.0665583773	-2.6032375159	-3.1616289507	-2.4089207428	-2.3216939547	-2.6238652410	-2.3002568032	-2.4674597362	-3.4731580435	-2.6409352644	-2.7134633651	-5.4651690016	-3.8288279811	-6.3809131847	-7.5107846583	-3.9447203940	-3.8716260906	-3.8200567431	-4.1368905600	-3.9732891327	-4.2101433666	-3.9714638095	-3.9984140350	-3.6187025773	-3.6601369852	-4.0954826307	-4.2850265950	-4.3080801292	-4.2388571074	-4.5176149058	-4.6060881319	-4.1782003317	-3.7630924628	-4.2554071177	-3.8576414811	-4.5428775071	-3.7068979596	-3.5195664433	-4.0336644655	-3.8806165790	-4.0199066511	-4.2054178953	-3.5983818938	-3.8149612926	-3.6099483462	-3.7467040635	-7.6627028604	-6.8279903105	-7.2525263184	-3.5610460826	-6.2803958390	-2.6556636121	-3.7385382017	-2.7826112976	-3.3954958002	-3.1289454041	-3.4542323347	-3.2013626569	-3.1570200669	-2.8100289077	-3.3120548516	-3.7608476928	-3.0812076682	-3.0166813850	-5.2834816317	-4.8098871326	-6.9402677935	-4.5230502815	-5.0992286017	-4.9204868780	-6.7670840579	-4.0517632531	-5.8223537631	-4.9485334132	-6.1031685367	-5.6412055930	-6.0751735357	-5.2714719033	-5.5173432317	-4.9417888264	-5.6015059302	-5.0976238648	-5.3222420010	-4.4837924026	-4.9389563938	-6.0992759492	-4.1012070470	-4.1208674898	-3.8892389813	-5.4674711519	-4.2882123531	-3.6789604932	-4.3344199137	-3.7519012891	-4.4707496883	-4.8970948558	-3.5658025194];

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
                        R(mm,k)=abs(c(mm,k))/(abs(c(mm,1))+abs(c(mm,2))+abs(c(mm,3)));
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
                    contribution(k)=S(k)/(S(1)+S(2)+S(3));
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
       
        %creation of results vector
        results = [inputs, hiddenNeurons, iterations, learningRate, rMin, rMedian, rGlobal, rTrain, rVal, rTest, rmse, mae, slope, intercept, input1, input2, input3, bestIteration];
        
        %save in file txt        
        dlmwrite('report_ANN33.txt',results,'-append','delimiter',',','newline','unix');
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