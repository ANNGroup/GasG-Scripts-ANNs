% Name of code: ScriptANN42
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
% Programming file size: 16 kB with 279 lines of code
%The MIT License (MIT)
%Copyright (c) 2018 D. Pérez-Zárate, E. Santoyo, A. Acevedo-Anicasio, C. García-López, L. Díaz-González

clear all
close all
clc

%target: BHT (°C) 
t = [212	262	315	300	287	302	292	217	260	248	238	301	352	250	240	240	340	311	250	270	304	296	327	329	240	250	277	340	330	250	250	240	262	302	320	267	276	281	327	281	330	271	204	270	260	240	260	240	284	319	356	278	314	300	274	265	267	324	250	250	275	182	215	240	240	250	260	350	270	330	300	338	240	343	325	300	296	322	287	271	260	230	240	250	240	260	293	240	267	306	250	280	325	279	250	278	307];
    
%inputs: ilr(H2S), ilr(CH4), ilr(H2)
p = [-0.726982954826	-0.552353522337	0.382054537221	0.245936848708	0.287049096574	-0.515607159939	0.218770041997	-0.924070761009	0.610318432316	-0.261589126432	-0.883753575380	-0.367723746530	-0.357992116889	0.615055582970	0.585190232662	0.758148517110	-0.553787146105	-0.661212516478	0.682802680017	0.603878030668	0.249596767108	0.341227783744	-0.455263333353	-0.572587242908	0.579312832236	0.804161631386	-0.707470594687	-0.958328799958	-0.520442509308	0.743165853850	0.545137825221	0.622821987387	-0.295625757835	-0.266285834141	-0.463501680553	-0.107121439310	-0.035982123417	-0.313649562966	-0.702366784414	0.252284043162	-0.091049719972	0.141045142318	-0.073591690198	0.516538551600	0.645254710642	0.741037379337	0.419364595101	0.842306361152	-0.292456876038	-0.255683881493	0.088680658917	0.294131724723	0.356679470911	-0.328752329661	-0.190002163951	0.191636315701	-0.024445615692	-0.446405149345	0.941493625198	0.662500610156	-0.412525583599	-0.704219841784	-0.754690201054	-0.246206528131	0.754217907913	1.006088548585	0.549816198198	-0.753478134872	-0.546829992281	-0.480095352726	-0.217276872701	-0.507953836446	-0.821585098908	0.578177657975	-0.121430612767	-0.019017840107	-0.059618036409	-0.448894940621	0.178735421148	-0.230745229609	0.810576035394	0.570342599567	0.697515962851	0.568109746457	0.626051868725	0.618370644707	0.562414285596	0.678679589311	0.045119665606	0.503883886874	0.607017214794	0.408636242024	0.421905683645	0.444691123281	0.641144710926	-0.977874710910	-0.046615972383
0.734669326029	2.991397776085	0.755272690474	0.685669050024	0.511151741862	2.969671190715	0.728150982858	0.940404785979	0.920605703713	2.485991368544	0.788537634625	2.138747583997	2.591295448561	1.015022699816	1.298659780699	1.108218840309	2.502045218991	3.026746031939	1.088678647917	1.281196292323	0.688590501387	0.739064760210	2.483762526798	2.647001211306	1.230872865995	1.276462320664	3.184102174230	4.403059868134	3.651934747583	1.547232688347	1.141420320672	0.961322107876	2.221098297290	2.985775469359	3.012753750931	2.931475237938	2.592105006593	2.619052350104	3.938147917984	0.637591692890	1.008236510347	2.165317569301	2.299315639059	1.107334071450	1.311028264777	1.637749129410	1.766628485352	0.823746680951	2.364373890803	1.003761284234	1.036151365556	1.631779704432	0.655953558306	3.428858766767	3.095588222761	2.230466903962	2.660737944537	3.391338544576	1.637240698193	1.147693302673	1.486814564150	2.550385444219	1.531100680160	2.474825520414	1.591363573002	1.510737565353	1.222599895637	2.829416979505	3.181376306808	3.711705973869	2.699138757236	2.539538041415	2.184157555618	0.705605486653	2.982147446954	0.738241379795	2.336682104676	2.350754800550	3.134957062912	2.472545721267	0.719210774442	2.038690919957	1.720380937483	1.371595571376	1.716085053238	0.925769428960	0.710029967072	1.145089090649	1.197627636715	0.596452971745	1.048314455166	0.603480804018	0.752657513966	0.863723810351	0.982377590782	2.967062039137	0.964119761876
3.373614745382	1.119302288299	0.671757858928	0.981490602933	1.181634719259	0.495302588399	0.866101577033	3.207586528438	0.869396977712	0.972427272168	3.079607630861	1.298277579343	1.234062266786	0.753286170863	0.633283548725	0.694636901923	0.948105529635	0.939591168028	0.656438115799	0.573115249489	0.952266370766	0.766123022293	0.903115785126	1.085483117470	0.597609778284	0.651606576366	0.703148534910	-0.679779569443	-0.612703248998	0.497757670935	0.645728890759	0.671936433612	1.633745121766	0.787650298122	0.055107191888	1.153698200160	0.790141013426	1.107706478034	-0.615314985580	1.126208676585	1.377908600947	1.770518899273	1.466733220575	0.663377636156	0.700912227750	0.543114915332	0.435763279855	1.014460817661	1.045698195873	1.408636919089	1.172066910663	1.884733320355	0.767909474235	-0.113186550935	0.757282811674	1.220916632149	1.046614114305	-0.529122239601	0.511361891919	0.726317240276	1.658000933169	0.736629837252	2.016650317067	1.601312119162	0.549660705926	0.577204189332	0.573071274139	0.837743168915	-0.225081045331	-0.538265209999	-0.123416017993	0.506241686212	2.597056762316	1.991227292161	-0.363603237194	1.213171010025	1.222818838407	0.652835807324	0.310727529454	1.117851290277	0.842691129841	0.378772597097	0.503136014245	0.448723828740	0.542010527590	0.850057755979	0.483948776908	0.800165685583	1.021321872634	0.809280261261	0.726459786313	0.646496612228	0.492415740857	0.624497794657	0.762859533856	0.733415288482	1.061282403764];

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
        dlmwrite('report_output_ANN42.txt',results,'-append','delimiter',',','newline','unix');
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
