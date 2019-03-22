% Initialize global constants
global_constants;

global datalength;
size_ = datalength;

% Choose which signals to simulate
% The given signals were chosen based on: n_cluster <= 15, one half LOS,
% one half NLOS for each receiver

signals = zeros(20, 20);

% Receiver 3
signals(3,:) = [6, 44, 55, 76, 85, 86, 116, 107, 141, 135, 155, 134, 171, 167, 235, 243, 641, 854, 881, 884];
% Receiver 8
signals(8,:) = [6, 44, 96, 104, 134, 144, 172, 194, 327, 391, 434, 440, 461, 614, 725, 854, 865, 887, 783, 765];
% Receiver 10
signals(10,:) = [22, 27, 92, 86, 148, 151, 205, 214, 262, 270, 385, 404, 593, 618, 769, 763, 826, 821, 844, 867];
% Receiver 15
signals(15,:) = [16, 40, 101, 133, 189, 205, 249, 298, 345, 395, 382, 433, 515, 535, 622, 717, 758, 778, 797, 808];
% Receiver 19
signals(19,:) = [17, 22, 175, 200, 257, 413, 504, 471, 510, 583, 664, 658, 677, 682, 777, 791, 850, 860, 885, 892];

% Load file
filename = 'piropa_manhattan_900_tx_pos.mat';

D = load(filename);

global BP;
BP = D.bulk_parameters;
global PAR;
PAR = D.par;

% Size of training data vector
size = 100;

% Allocate output vector including features and ranging estimate
% Contents: features, los/nlos id, receiver id, transmitter id, estimated
% distance, actual distance, calculation time, number of path components
Traindata = repmat(struct('features', [0 0 0 0 0 0], 'los', 0, 'rec_id', 0, 'trans_id', 0, 'es_d', 0, 'd', 0, 'time', 0, 'path_comp', 0), size, 1);

k = 0;

for j = [3, 8, 10, 15, 19]
    for i = 1:20 
       
       tic
       
       k = k + 1;
       
       % Exceptions/Already calculated
       
       %{
       if ((k<=42))
            continue
       end
       %}
       
       % Extract Data
       F = BP{j}{signals(j,i)};
       data.L = F.n_cluster;
       data.alpha = F.power;
       data.tau = F.delay;
       
       % Main
       
       % Calculate rBPF matrix
       handlerwithdata = @(x) handler(x, data);
       rBPFval = generate_array(handlerwithdata, size_);
       % Calculate energy matrix
       y = energy_averager(rBPFval);
       % Calculate PDP estimates
       gamma = PDP_estimate(y);
       % Estimate distance with TOA ranging
       Traindata(k).es_d = TOAestimate(gamma);
       
       % Calculate received energy
       Traindata(k).features(1) = received_energy(gamma);

       % Calculate maximum amplitude
       Traindata(k).features(2) = maximum_amplitude(gamma);

       % Calculate rise time (ns)
       Traindata(k).features(3) = rise_time(gamma);

       % Calculate mean excess delay
       Traindata(k).features(4) = mean_excess_delay(gamma);

       % Calculate RMS delay spread
       Traindata(k).features(5) = rms_delay_spread(gamma);

       % Calculate kurtosis
       Traindata(k).features(6) = kurtosis(gamma);

       % Calculate actual distance
       rec = PAR.UE(j).pos;
       trans = PAR.BS.pos(i,:);
       
       Traindata(k).d = norm(rec-trans);
       
       % Calculate remaining parameters
       Traindata(k).los = F.los(1);
       
       Traindata(k).rec_id = j;
       Traindata(k).trans_id = signals(j,i);
       
       Traindata(k).time = toc;
       
       Traindata(k).path_comp = F.n_cluster;
       
       sprintf('Traindata[%d][%d] calculated.', j, signals(j,i))
       filename = strcat('machlearnlocalize/training data/TrainingData[', num2str(j), '][', num2str(signals(j,i)), '].mat');
       save(filename, 'Traindata');
      
   end
end
