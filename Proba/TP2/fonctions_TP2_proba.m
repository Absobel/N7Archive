
% TP2 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom :
% Prenom : 
% Groupe : 1SN-

function varargout = fonctions_TP2_proba(nom_fonction,varargin)

    switch nom_fonction
        case 'calcul_histogramme_image'
            [varargout{1},varargout{2},varargout{3}] = calcul_histogramme_image(varargin{:});
        case 'vectorisation_par_colonne'
            [varargout{1},varargout{2}] = vectorisation_par_colonne(varargin{:});
        case 'calcul_parametres_correlation'
            [varargout{1},varargout{2},varargout{3}] = calcul_parametres_correlation(varargin{:});
        case 'decorrelation_colonnes'
            varargout{1} = decorrelation_colonnes(varargin{:});
        case 'encodage_image'
            varargout{1} = encodage_image(varargin{:});
        case 'coeff_compression'
            varargout{1} = coeff_compression(varargin{:});
        case 'gain_compression'
            varargout{1} = gain_compression(varargin{:});
    end

end

% Fonction calcul_histogramme_image (exercice_1.m) ------------------------
function [histogramme, I_min, I_max] = calcul_histogramme_image(I)
    I_min = min(I,[],'all');
    I_max = max(I,[],'all');
    histogramme = histcounts(I,(I_min:I_max+1));

end

% Fonction vectorisation_par_colonne (exercice_1.m) -----------------------
function [Vg,Vd] = vectorisation_par_colonne(I)
    [n m] = size(I);
    I_vectorize = I(:);
    Vd = I_vectorize(1:n*m-n);
    Vg = I_vectorize(n+1:end);


end

% Fonction calcul_parametres_correlation (exercice_1.m) -------------------
function [r,a,b] = calcul_parametres_correlation(Vd,Vg)
    [n,~] = size(Vd);
    x_barre = sum(Vg)/n;
    y_barre = sum(Vd)/n;
    sigma_x = sqrt(sum((Vg-x_barre).^2)/n);
    sigma_y = sqrt(sum((Vd-y_barre).^2)/n);
    sigma_xy = sum(dot(Vg,Vd))/n-x_barre*y_barre;
    r = sigma_xy/(sigma_x*sigma_y);
    a = sigma_xy/(sigma_x^2);
    b = y_barre - a*x_barre;


end

% Fonction decorrelation_colonnes (exercice_2.m) --------------------------
function I_decorrelee = decorrelation_colonnes(I)
    I_decorrelee = I;
    [~,m] = size(I);
    for i=2:m
        I_decorrelee(1:end,i) = I(1:end,i) - I(1:end,i-1);
    end


end

% Fonction encodage_image (exercice_3.m) ----------------------------------
function I_encodee = encodage_image(I)
    [histogramme,I_min,I_max] = calcul_histogramme_image(I);
    frequences = histogramme/max(histogramme);
    dictionnaire = huffman_dictionnaire(I_min:I_max,frequences);
    I_encodee = huffman_encodage(I(:),dictionnaire);


end

% Fonction coeff_compression (exercice_3.m) -------------------------------
function coeff_comp = coeff_compression(signal_non_encode,signal_encode)
    coeff_comp = length(signal_non_encode)*8/length(signal_encode);


end

% Fonction coeff_compression (exercice_3.m) -------------------------------
function gain_comp = gain_compression(coeff_comp_avant,coeff_comp_apres)

    gain_comp = coeff_comp_apres/coeff_comp_avant;

end

