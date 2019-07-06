function bac = calcBAC(alcConsumed, age, weight, gender, time, med, food)
    if lower(gender) == 'male'
        r = 0.73;
    else
        r = 0.66;
    end
    if lower(food) == 'yes'
        if time > 30
            time = time - 30;
        else
            time = 0;
        end
    end
    if age > 21
        factor = (age-21)/100 + 1;
    else
        factor = 1;
    end
    if lower(med) == 'yes'
        factor = factor + .1;
    end
    bac = ((factor * alcConsumed * 5.14) / (weight * r)) - 0.015*(time/60);
end