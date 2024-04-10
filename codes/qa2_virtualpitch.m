fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 


notes = [293.5, 329.5, 392]; 
generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

without_fundamental = 2:10; 
without_first_and_second = 3:10; 
melody_no_fundamental = [];
melody_no_first_and_second = [];


for idx = song_notes
    if idx == -1
        melody_no_fundamental = [melody_no_fundamental; zeros(length(t), 1)]; % Add silence for pauses
    else
        melody_no_fundamental = [melody_no_fundamental; generateToneWithHarmonics(notes(idx), without_fundamental)];
    end
end


for idx = song_notes
    if idx == -1
        melody_no_first_and_second = [melody_no_first_and_second; zeros(length(t), 1)]; % Add silence for pauses
    else
        melody_no_first_and_second = [melody_no_first_and_second; generateToneWithHarmonics(notes(idx), without_first_and_second)];
    end
end


sound(melody_no_fundamental,fs)
pause(10)
sound(melody_no_first_and_second,fs)
pause(10)

audiowrite('melodywithoutfund.wav', melody_no_fundamental, fs);
audiowrite('melodywithoutboth.wav', melody_no_first_and_second, fs);
