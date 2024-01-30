require 'rails_helper'

RSpec.describe 'Creating a book Sunny Day', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Of Mice and Men'
    click_on 'Create Book'
    visit books_url
    expect(page).to have_content('Of Mice and Men')
  end
end

RSpec.describe 'Creating a book Rainy Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: ''
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('')
    end
end

RSpec.describe Book do
    it 'has a author' do
        book_params = {title: 'Of Mice and Men', author: 'And Men'}
        book = Book.new(book_params)
        expect(book.author).to eq('And Men')
    end
end

RSpec.describe 'Creating a book with author Sunny Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: 'Ozami'
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('Ozami')
    end
end

RSpec.describe 'Creating a book with author Rainy Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: ''
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('')
    end
end

RSpec.describe Book do
    it 'has a price' do
        book_params = {title: 'Of Mice and Men', author: 'And Men', price: 100}
        book = Book.new(book_params)
        expect(book.price).to eq(100)
    end
end

RSpec.describe 'Creating a book with price Sunny Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: 'Ozami'
      fill_in 'Price', with: '100'
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content(100)
    end
end

RSpec.describe 'Creating a book with price Rainy Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: ''
      fill_in 'Price', with: ''
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('')
    end
end

RSpec.describe Book do
    it 'has a date' do
        book_params = {title: 'Of Mice and Men', author: 'And Men', price: 100, published_date: '1/1/1'}
        book = Book.new(book_params)
        expect(book.published_date.to_s).to eq('0001-01-01')
    end
end

RSpec.describe 'Creating a book with date Sunny Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: 'Ozami'
      fill_in 'Price', with: '100'
      fill_in 'book[published_date]', with: '1/1/1'
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('0001-01-01')
    end
end

RSpec.describe 'Creating a book with date Rainy Day', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'No Longer Human'
      fill_in 'Author', with: 'hey'
      fill_in 'Price', with: '10'
      fill_in 'book[published_date]', with: ''
      click_on 'Create Book'
      visit books_url
      expect(page).to have_content('')
    end
end