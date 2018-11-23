<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/proyecto/{id}/niveles', 'AspirantesController@bydepa');
Route::get('/campus/{id}/universidades', 'AspirantesController@bycampus');
Route::get('/facultads/{id}/campus', 'AspirantesController@byfacultads');
Route::get('/carreras/{id}/facultads', 'AspirantesController@bycarreras');
Route::get('/periodos/{id}/university', 'AspirantesController@byperiodos');
Route::get('/preplanilla/{date}/pago','PREPlanillasController@preplanilla' );
Route::get('/identidad/{identidad}/respuesta','AspirantesController@byrespuesta');
Route::get('/complementaria/{complementaria}/respuesta','AspirantesController@bycomplementaria');

Route::get('/periodos/{id}/verifica','AspirantesController@byverificaperiodos');