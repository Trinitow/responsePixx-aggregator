function a = getButtonTimeExNonExklusiv(buttonStates, tgetsecs, tStart, tEnd)
% a gibt die Zeiten fuer alle Tastenkombinationen aus, die aufgetreten sind.
% Jede Zeile entspricht einer Kombination. 5 Spalten fuer die Tasten und eine Spalte fuer dir Zeit
buttonStates = vertcat([0 0 0 0 0], buttonStates, [0 0 0 0 0]);
tgetsecs= [tStart tgetsecs tEnd];
% Matrix erstellen, in der alle Kombinationen von Tastendruecken stehen, die auftauchen. In der sechsten Spalte steht die Zeit
a=unique(buttonStates,'rows');
buttonStates (1:end-1,6) = tgetsecs(2:end)-tgetsecs(1:end-1); % Zeiten der einzelnen Zustaende berechnen
% Zeiten berechnen
for r=1:size(a,1)
    [~, index]=ismember(buttonStates(:,1:5),a(r,:),'rows');
    uniqueCombinationsTimePressed(r) = sum(buttonStates(find(index),6));
end
% Sechste Spalte mit Zeiten fuellen
a(:,6)=uniqueCombinationsTimePressed;
end