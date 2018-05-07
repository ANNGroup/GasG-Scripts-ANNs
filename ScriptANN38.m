% Name of code: ScriptANN38
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
% Programming file size: 16 kB with 277 lines of code

clear all
close all
clc

%target: BHT (°C) 
t = [212	262	315	300	287	302	292	217	260	248	238	301	352	250	240	240	340	311	250	270	304	296	327	329	240	250	277	340	330	250	250	240	262	302	320	267	276	281	327	281	330	271	204	270	260	240	260	240	284	319	356	278	314	300	274	265	267	324	250	250	275	182	215	240	240	250	260	350	270	330	300	338	240	343	325	300	296	322	287	271	260	230	240	250	240	260	293	240	267	306	250	280	325	279	250	278	307];
    
%inputs: ln(H2S/CO2), ln(CH4/CO2), ln(H2/CO2) mmol/mol
p = [-2.739078943341	-3.393866354432	-2.781308931732	-2.668711833969	-2.802362171728	-2.750658449148	-2.510662260012	-2.241891024322	-3.857641481122	-3.427681692917	-2.022149429063	-3.078462135435	-3.586093560882	-3.852603687092	-3.976947687951	-4.303750776056	-2.592798430080	-2.921746690371	-4.022600657363	-3.938940077386	-2.648896442403	-2.754946360260	-2.797124538797	-2.875787809133	-3.836109691097	-4.590263716192	-2.710609779724	-1.897119984886	-2.293165871078	-4.571716809729	-3.685454793233	-3.714866286039	-3.770609207908	-3.813143340301	-2.442506283717	-4.619500011543	-3.985270752653	-3.599605268689	-2.126128655652	-2.794887951909	-2.568376800879	-5.095316620481	-4.301563943393	-3.583195888865	-4.240074796226	-4.728930156173	-3.852987466884	-4.562680134367	-3.276030105565	-2.132722068045	-2.873234144830	-5.006746552414	-2.698923130098	-3.138928611484	-4.128333395832	-4.683575347309	-4.398108390449	-2.279922321654	-5.258618107537	-4.118145090688	-2.568664532013	-1.982323860254	-2.069248677009	-4.183688607371	-4.716958276321	-5.362414214075	-3.714213709331	-2.301498428271	-2.089804328715	-2.566443009718	-2.548696007351	-2.258133330423	-3.350065027164	-4.798791298036	-2.889059298722	-2.251215987362	-4.105203723519	-2.363238117850	-4.703859943712	-3.666375111782	-4.146560853940	-4.547417649376	-4.660872225820	-3.804853305006	-4.498368302841	-3.864409813330	-3.019169294674	-4.245989498412	-2.773726908154	-3.090177924905	-3.839665214446	-2.641417836999	-2.683735630924	-3.036725681953	-3.897467321801	-1.714921687059	-2.274414216027
-4.666970586894	-7.838711281498	-3.166018577789	-3.160674259528	-3.022443920634	-7.116926648137	-3.093073881433	-4.700480365792	-4.122027990971	-6.842329762234	-4.237723145067	-6.217922179687	-7.266046678695	-4.225927585989	-4.739890630446	-4.588852201914	-6.440338772719	-7.563834078407	-4.390325437489	-4.654066164665	-3.139260994298	-3.177543175324	-6.482939535727	-6.927449611809	-4.524342856854	-5.016348111503	-7.610837097586	-8.645026562926	-7.501871078936	-5.415686880023	-4.312462171288	-4.011437305908	-6.908965912487	-7.846541571636	-6.787851351757	-8.361301867111	-7.210824472525	-7.250843668163	-7.942651753264	-3.218991592407	-3.931973044910	-7.547810255244	-7.221713346397	-4.208901788630	-4.933221976786	-5.686769890960	-5.423585546002	-4.380358577573	-6.585381382880	-3.723665165899	-4.016841825219	-6.589295302431	-2.997877941322	-7.803331804077	-8.188342832738	-7.144313572039	-7.691404863390	-7.064759027792	-5.932347202240	-4.586859229103	-4.973032319317	-6.101812604277	-5.011749500340	-7.562907082315	-5.599347456519	-5.789858228902	-4.434029136974	-6.832391360237	-6.759513035841	-7.791293224384	-6.161728257613	-6.086774726912	-7.186997581237	-4.845311313671	-6.713157909574	-3.182268618522	-7.051355782945	-5.877146316830	-8.290612471882	-7.020935836352	-3.881082938799	-6.237707658439	-5.781463421207	-4.681279438316	-5.714763627165	-4.123733021222	-3.093400945018	-4.688633609762	-4.176706371027	-3.108081216397	-4.265130989261	-2.802628941157	-3.008884321216	-3.465678771369	-4.193913692246	-6.731739381064	-3.521139890160
-7.662702860448	-5.467471151855	-3.016681384993	-3.454232334660	-3.760847692782	-4.051763253075	-3.201362656870	-7.252526318418	-3.998414035003	-4.920486877993	-6.827990310513	-5.097623864818	-5.517343231661	-3.852603687092	-3.880616579012	-4.033664465494	-4.470749688280	-4.941788826364	-3.814961292585	-3.746704063535	-3.395495800239	-3.157020066937	-4.483792402581	-4.938956393840	-3.706897959617	-4.205417895287	-4.523050281532	-2.467459736184	-2.321693954692	-4.095482630733	-3.660136985248	-3.609948346180	-6.075173535702	-5.099228601708	-3.161628950681	-6.103168536688	-4.948533413191	-5.322242001020	-2.408920742810	-3.738538201679	-4.288212353064	-6.940267793509	-6.099275949205	-3.618702577322	-4.136890559990	-4.308080129225	-3.763092462768	-4.542877507071	-4.897094855824	-4.120867489786	-4.101207047029	-6.767084057902	-3.081207668241	-3.473158043451	-5.271471903318	-5.822353763061	-5.641205592964	-2.300256803234	-4.517614905800	-4.019906651104	-5.066558377328	-3.828827981059	-5.465169001570	-6.380913184707	-4.285026595025	-4.606088131894	-3.598381893806	-4.334419913729	-2.603237515888	-2.623865240998	-2.713463365093	-3.561046082604	-7.510784658331	-6.280395838960	-2.640935264439	-3.678960493191	-5.601505930219	-3.751901289146	-4.809887132597	-5.283481631660	-3.973289132666	-4.178200331660	-4.255407117712	-3.519566443280	-4.238857107356	-3.971463809494	-2.782611297556	-4.210143366639	-3.889238981312	-3.312054851604	-3.820056743058	-2.810028907653	-2.655663612145	-3.128945404050	-3.871626090617	-3.944720393995	-3.565802519393];

%assignment of columns and rows
[inputs,Rows] = size(p);

%normalization between -1 and 1
[pn,ps] = mapminmax(p);
[tn,ts] = mapminmax(t);

%index creation for training, validation and test
p1 = 1:4:Rows;
p2 = 2:4:Rows;
p3 = 3:4:Rows;
p4 = 4:4:Rows;

%percentage assignment for: training(50%), validation(25%) and test(25%)
aa = [p2 p4];
vv = [p1];
tt = [p3];

%Creation of training, validation and test vectors
val.P = pn(:,vv); val.T = tn(:,vv);
test.P = pn(:,tt); test.T = tn(:,tt);
trainP = pn(:,aa); trainT = tn(:,aa);

%initial parameters
hiddenNeurons = 1;
maxHiddenNeurons = 20;
iterations = 15000;
targetIdeal = 0.99;
flagHiddenNeurons = 1;
learningRate = 0.01;
lrOption= 1 ;
rowOutputFile = 4;

%cycle that controls the number of hidden neurons
while(hiddenNeurons <= maxHiddenNeurons & flagHiddenNeurons == 1)

    %cycle that controls the learning rate (0.01, 0.001, 0.0001, 0.00001)
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
                
                %calculate the RMSE
                for i=1:length(t)
                    tmpDifference(i)=(t(i)-outputANN(i));
                end
                tmp1=tmpDifference.^2;
                tmp2=sum(tmp1);
                rmse=sqrt(tmp2/length(t));               
                                    
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
        rMax = max(rCalculated);
        rMin = min(rCalculated);
        rSort = sort(rCalculated);
        rMedian = median(rSort);        
        input1 = contribution(1);
        input2 = contribution(2);
        input3 = contribution(3);
       
        %creation of results vector
        results = [inputs, hiddenNeurons, iterations, learningRate, rMin, rMedian, rMax, rmse, slope, intercept, input1, input2, input3, bestIteration];
        
        %save in file txt        
        dlmwrite('report_output_ANN38.txt',results,'-append','delimiter',',','newline','unix');
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