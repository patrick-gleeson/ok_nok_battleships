require 'rubygems'
require 'bundler/setup'
require_relative 'lib/ok_nok_battleships'

game = OkNokBattleships::Game.new STDIN, STDOUT, OkNokBattleships::Quitter.new
game.begin
