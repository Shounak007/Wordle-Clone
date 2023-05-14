function WordleProject
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description: This program is a wordle game where it asks the user
% to take guesses and output the correct value depending if the letter is
% in the word or in the correct place
%
% Function Call
% A10Prob3_wordle_mukher53
% Input Arguments
%
% Output Arguments
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION                

max_guesses = 6; %max number of guesses counter
correct = 0; % checks to see if we have correct letters
max_letters = 5; %letter limit
wordlenoti = 4004;%This is the wordle key
solution = wordle_dictionary(wordlenoti);
guesses = 0; %number of guesses counter


%% ____________________
%% CALCULATIONS


while guesses < max_guesses && correct < max_letters %defines the following condition where the code can run
    CHAR = input("Enter a five letter long word: ", 's'); 

    if length(CHAR) ~= max_letters %condtion to make sure it keeps running if our input is not five letyters
        fprintf("This word is not five letters. Please try again. \n");
        continue; %This allows us to pass the function if we do not meet the criteria and does not count as guess
    end

    guesses = 1 + guesses;
    fprintf("Guess #%d: %s \n", guesses, CHAR);

    % Count the number of correctly guessed letters
    correct = 0; %number of correct letters
    oddones = 0; %correct letters in wrong place
    for i = 1:max_letters %for stament to iterate through loop
        if CHAR(i) == solution(i)
            correct = correct + 1; %iterate correct variable
        elseif any(CHAR(i) == solution)
            oddones = oddones + 1; %iterate oddones variable
        end
    end

    % Print the current result
    fprintf("Result: ");
    for i = 1:max_letters
        if CHAR(i) == solution(i)
            fprintf("%c", CHAR(i));
        elseif any(CHAR(i) == solution)
            fprintf("*"); %prints * for incorrect location
        else
            fprintf("-"); %pritns for not in solution
        end
    end
    fprintf("\n");

    if correct == max_letters %win case then this is the print out 
        fprintf("You solved this Wordle! \n");
    end

    if guesses == max_guesses  %lose then print this out
        fprintf("Out of guesses. \n");
    end
end





