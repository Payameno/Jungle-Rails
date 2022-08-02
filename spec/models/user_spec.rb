require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

      it 'Should return invalid without a first name' do

        user = User.create({
          first_name: nil,
          last_name: 'Trump',
          email: 'nilly@gmail.com',
          password: '1234Nilly',
          password_confirmation: '1234Nilly',
        })

        expect(user).to_not be_valid

        end

        it 'Should return invalid without a last name' do

          user = User.create({
            first_name: 'Donald',
            last_name: nil,
            email: 'nilly@gmail.com',
            password: '1234Nilly',
            password_confirmation: '1234Nilly',
          })
  
          expect(user).to_not be_valid
  
          end

      it 'Should return invalid without an email' do

        user = User.create({
          first_name: 'Nelly',
          last_name: 'Furtado',
          email: nil,
          password: '1234Nilly',
          password_confirmation: '1234Nilly',
        })

        expect(user).to_not be_valid
  
        end

      it 'Should return invalid without the password' do

        user = User.create({
          first_name: 'Nelly',
          last_name: 'Furtado',
          email: 'nilly@gmail.com',
          password: nil,
          password_confirmation: '1234Nilly',
        })

        expect(user).to_not be_valid
  
        end

        it 'Should return invalid without the password confirmation' do

          user = User.create({
            first_name: 'Nelly',
            last_name: 'Furtado',
            email: 'nilly@gmail.com',
            password: '1234Nilly',
            password_confirmation: nil,
          })

          expect(user).to_not be_valid
    
          end

end

  describe '.authenticate_with_credentials' do
  
    it 'Should return invalid if passwords do not match ' do

      user = User.create({
        first_name: 'Nelly',
        last_name: 'Furtado',
        email: 'nilly@gmail.com',
        password: 'thisIsDifferent',
        password_confirmation: '1234Nilly',
      })

      expect(user).to_not be_valid

      end

      it 'Should not allow save if passwords do not match' do

        user = User.create({
          first_name: 'Nelly',
          last_name: 'Furtado',
          email: 'nilly@gmail.com',
          password: 'thisIsDifferent',
          password_confirmation: '1234Nilly',
        })

        expect(user.save).to_not be_truthy
  
        end

        it 'Should not allow existing emails for registeration -Not case sensitive-' do

          user1 = User.new({
            first_name: 'Nelly',
            last_name: 'Furtado',
            email: 'nilly@gmail.com',
            password: 'thePasssword',
            password_confirmation: 'thePasssword',
          })
          user1.save

          user2 = User.new({
            first_name: 'Nelly',
            last_name: 'Furtado',
            email: 'NILLY@GMAIL.COM',
            password: 'thePasssword',
            password_confirmation: 'thePasssword',
          })
          expect(user2.save).to_not be_truthy
    
          end

          it 'Should ignore spaces before or after Email input' do

            user = User.new({
              first_name: 'Nelly',
              last_name: 'Furtado',
              email: '  nilly@gmail.com ',
              password: 'thePasssword',
              password_confirmation: 'thePasssword',
            })

            expect(user.save).to be_truthy

      
          end

          it 'Password should have a minimum length of 5' do

            user = User.new({
              first_name: 'Nelly',
              last_name: 'Furtado',
              email: 'nilly@gmail.com',
              password: '1234',
              password_confirmation: '1234',
            })

            expect(user).to_not be_valid

      
          end
  end
  
end