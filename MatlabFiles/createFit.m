function [fitresult, gof] = createFit(x, y, u, v)
%CREATEFITS(X,Y,U,V)
%  Create fits.
%
%  Data for 'f(x,y)' fit:
%      X Input : x
%      Y Input : y
%      Z Output: u
%  Data for 'g(x,y)' fit:
%      X Input : x
%      Y Input : y
%      Z Output: v
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 12-Oct-2019 00:28:20

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'f(x,y)'.
[xData, yData, zData] = prepareSurfaceData( x, y, u );

% Set up fittype and options.
ft = fittype( 'poly22' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'f(x,y)' );
h = plot( fitresult{1}, [xData, yData], zData );
legend( h, 'f(x,y)', 'u vs. x, y', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
zlabel( 'u', 'Interpreter', 'none' );
grid on

%% Fit: 'g(x,y)'.
[xData, yData, zData] = prepareSurfaceData( x, y, v );

% Set up fittype and options.
ft = fittype( 'poly22' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'g(x,y)' );
h = plot( fitresult{2}, [xData, yData], zData );
legend( h, 'g(x,y)', 'v vs. x, y', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
zlabel( 'v', 'Interpreter', 'none' );
grid on


