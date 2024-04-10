fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 

notes = [293.5, 329.5, 392]; 

generate_tone_with_harmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


all_harmonics = 1:10;
odd_harmonics = [3, 5, 7];
even_harmonics = [2, 4, 6];
song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

melody_all = [];
melody_odd = [];
melody_even = [];


for idx = song_notes
    if idx == -1
        melody_all = [melody_all; zeros(length(t), 1)]; 
    else
        melody_all = [melody_all; generate_tone_with_harmonics(notes(idx), all_harmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melody_odd = [melody_odd; zeros(length(t), 1)]; 
    else
        melody_odd = [melody_odd; generate_tone_with_harmonics(notes(idx), odd_harmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melody_even = [melody_even; zeros(length(t), 1)]; 
    else
        melody_even = [melody_even; generate_tone_with_harmonics(notes(idx), even_harmonics)];
    end
end

sound(melody_all,fs)
pause(10)
sound(melody_odd,fs)
pause(10)
sound(melody_even,fs)
pause(10)

audiowrite('melody.wav', melody_all, fs);
audiowrite('oddmelody.wav', melody_odd, fs);
audiowrite('evenmelody.wav', melody_even, fs);
