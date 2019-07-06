function inputs = takeFactors()
    T = readtable('alcDrinks.xlsx', 'ReadRowNames', true);
    while true    
        prompt = {'What is your age?','What is your gender? (Male/Female)', ...
            'What is your weight? (lbs)','How long has it been since you have consumed alcohol? (minutes)', ...
            'Did you consume any food before drinking?(Yes/No)','Have you taken any medication?(Yes/No)'};
        userInfoCell = inputdlg( prompt, 'Basic Info', 1);
        [~, tf1] = str2num(userInfoCell{1});
        if ~tf1
            uiwait(msgbox('Please enter a positive integer for age.', 'Error!'));
            continue;
        end
        [~, tf3] = str2num(userInfoCell{3});
        if ~tf3
            uiwait(msgbox('Please enter a positive integer for weight, with no units.', 'Error!'));
            continue;
        end
        [~, tf4] = str2num(userInfoCell{4});
        if ~tf4
            uiwait(msgbox('Please enter a positive integer for time, with no units.', 'Error!'));
            continue;
        end
        if ~strcmpi(userInfoCell{2},'male') && ~strcmpi(userInfoCell{2}, 'female')
            uiwait(msgbox('Please enter "male" or "female" for gender.', 'Error!'));
            continue;
        end
        if ~strcmpi(userInfoCell{5},'yes') && ~strcmpi(userInfoCell{5}, 'no')
            uiwait(msgbox('Please enter "yes" or "no" for whether you ate food before you drank.', 'Error'));
            continue;
        end
        if ~strcmpi(userInfoCell{6}, 'yes') && ~strcmpi(userInfoCell{6}, 'no')
            uiwait(msgbox('Please enter "yes" or "no" for whether you had medicine before you drank.', 'Error!'));
            continue;
        end
        break;
    end
    fields = {'age', 'gender', 'weight', 'time', 'food', 'meds'};
    userInfoStruct = cell2struct(userInfoCell, fields);
    age = str2num(userInfoStruct(1).age);
    weight = str2num(userInfoStruct(1).weight);
    gender = userInfoStruct(1).gender;
    time = str2num(userInfoStruct(1).time);
    food = userInfoStruct(1).food;
    meds = userInfoStruct(1). meds;
    
    alcListCell = {'Beer: Bud Light', 'Beer: Coors Light', 'Beer: Miller Lite',...
        'Beer: Budweiser', 'Beer: Heineken', 'Beer: Light, Other' ,'Beer: Other', 'Wine: Bordeaux',...
        'Wine: Merlot', 'Wine: Pinot Noir', 'Wine: Chardonnay', 'Wine: Other',...
        'Champagne', 'Liquor: Jameson Irish Whiskey', 'Liquor: Jack Daniels',...
        'Liquor: Crown Royal', 'Liquor: Bulleit', 'Liquor: Other',...
        'Vodka: Titos', 'Vodka: Ketel One', 'Vodka: Grey Goose',...
        'Vodka: Absolut', 'Vodka: Smirnoff', 'Vodka: Other',...
        'Rum: Captain Morgan', 'Rum: Bacardi', 'Rum: Goslings', 'Rum: Other',...
        'Tequila: Patrón', 'Tequila: Don Julio', 'Tequila: Corazón',...
        'Tequila: Other', 'Gin: Hendricks', 'Gin: Tanqueray', 'Gin: Other'};
    stringCaption = 'Which of the following alcohol did you drink? (Ctrl+click to select multiple drinks)';
    [alcChoice, ~] = listdlg('ListString', alcListCell, ...
    'PromptString', stringCaption, 'ListSize',[300 200]); 
    noDrinks = cell(1,numel(alcChoice));
    textString = 'Enter amount of each that you drank(in fl oz)';
    textString2 = 'Common measurements: One can = 12 fl. oz';
    textString3 = 'One shot = 1.5 fl. oz';
    textString4 = 'One wine glass = 5 fl. oz';
    for i = 1:numel(alcChoice)
        if i == 1
            noDrinks{i} = sprintf('%s\n%s\n%s\n%s\n\n How many fl. oz of %s did you drink?', textString, textString2, textString3, textString4, string(T{1,alcChoice(i)}));
        else
            noDrinks{i} = sprintf('How many fl. oz of %s did you drink?', string(T{1,alcChoice(i)}));
        end
    end
    while true
        userAmtCell = inputdlg(noDrinks, 'Number of Drinks', 1);
        flag = false;
        for i = 1:numel(alcChoice)
        [~, tf] = str2num(userAmtCell{i});
            if ~tf
                uiwait(msgbox('Please enter a positive integer for the amount you drank, with no units.', 'Error!'));
                flag = true;
                break;
            end
        end
        if flag
            continue;
        else
            break;
        end
    end
    ozAlc = cell(1,numel(alcChoice));
    for i = 1:numel(alcChoice)
        ozAlc{i} = str2double(string(userAmtCell{i})) * (str2double(string(T{2,alcChoice(i)}))/100);
    end
    list = {age, weight, gender, time, food, meds};
    inputs = {list, ozAlc};
end