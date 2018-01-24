function a = getButtonTimeExNonExklusiv(buttonStates, tgetsecs, tStart, tEnd)
% IN:
% buttonStates: can be retrieved from responsePixx after the experimental block was finished 
% tgetsecs: can be retrieved from responsePixx after the experimental block was finished - global times
% tStart: global start time of the block (save with block beginning as GetSecs)
% tEnd: global end time of the block (save with block ending as GetSecs)
% OUT: 
% a contains all unique key-press-states in the buttonStates manner (col=1:5) + total time of this state (col=6)
% every Row contains one unique sttes
buttonStates = vertcat([0 0 0 0 0], buttonStates, [0 0 0 0 0]);
tgetsecs= [tStart tgetsecs tEnd];
a=unique(buttonStates,'rows');
buttonStates (1:end-1,6) = tgetsecs(2:end)-tgetsecs(1:end-1); % Zeiten der einzelnen Zustaende berechnen
% Zeiten berechnen
for r=1:size(a,1)
    [~, index]=ismember(buttonStates(:,1:5),a(r,:),'rows');
    uniqueCombinationsTimePressed(r) = sum(buttonStates(find(index),6));
end
a(:,6)=uniqueCombinationsTimePressed;
end
