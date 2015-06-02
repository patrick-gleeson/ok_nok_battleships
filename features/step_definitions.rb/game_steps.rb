Given(/^I have not started playing$/) do
  @output = DummyOutput.new
  @input = DummyInput.new
  @quitter = double("quitter").as_null_object
  @game = OkNokBattleships::Game.new(@input, @output, @quitter)
end

When(/^I start a new game$/) do
  @game.begin
end

Then(/^the application should exit$/) do
  expect(@quitter).to have_received(:quit)
end
