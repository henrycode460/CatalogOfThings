require './make_choice'


def main
  make_choice = MakeChoice.new
  loop do
    make_choice.display_list
    option = gets.chomp.to_i
    case option
    when 1..12
      make_choice.choices(option)
    else
      break
    end
  end
  make_choice.on_exit
end
main
