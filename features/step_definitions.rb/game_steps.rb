Given(/^I have not started playing$/) do
  @output = DummyOutput.new
  @input = DummyInput.new
  @game = OkNokBattleships::Game.new(@input, @output)
end

When(/^I start a new game$/) do
  @game.begin
end
