require 'pry'
require 'minitest/pride'
require 'minitest/autorun'
require './email_detector'

INPUT1 = File.open('./email_test_cases/01.txt', "r")
OUTPUT1 = File.open('./email_test_cases/01-output.txt')
INPUT2 = File.open('./email_test_cases/02.txt', "r")
OUTPUT2 = File.open('./email_test_cases/02-output.txt')
INPUT3 = File.open('./email_test_cases/03.txt', "r")
OUTPUT3 = File.open('./email_test_cases/03-output.txt')

class EmailDetectorTest < Minitest::Test

  def test_it_recognizes_email_addresses
    text = "An email: adam@test.com"

    assert_equal "adam@test.com", EmailDetector.parse(text)
  end

  def test_it_strips_trailing_punctuation
    text = "An email entitled, adam@test.com."

    assert_equal "adam@test.com", EmailDetector.parse(text)
  end

  def test_it_finds_more_than_one_email
    text = "Two emails are adam@test.com and another@something.com."

    assert_equal "adam@test.com;another@something.com", EmailDetector.parse(text)
  end

  def test_it_parses_lots_of_text
    text = INPUT1.read
    output = OUTPUT1.read.strip

    assert_equal output, EmailDetector.parse(text)
  end

  def test_it_parses_different_types_of_text
    text = INPUT2.read
    output = OUTPUT2.read.strip

    assert_equal output, EmailDetector.parse(text)
  end
end