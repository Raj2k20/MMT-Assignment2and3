for i = 1:length(musicFiles)
    filePath = fullfile(samplesDir, musicFiles{i});
    audio = miraudio(filePath);


    frameLength = 2; 
    hopSize = 2; 
    tempo = mirtempo(audio, 'Frame', frameLength, hopSize);
    
    tempodata = mirgetdata(tempo);
    fprintf('Frame-based tempo estimation for %s:\n', musicFiles{i});
    disp(tempodata);
    fprintf('Tempo range for %s: %.2f BPM to %.2f BPM\n', musicFiles{i}, min(tempodata), max(tempodata));
end
