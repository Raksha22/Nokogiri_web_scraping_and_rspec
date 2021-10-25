COMMANDS
          xdg-open coverage/index.html

MATCHERS

          .....................................Equality/Identity Matchers

          a = "test string"
          b = a

          # The following Expectations will all pass
          expect(a).to eq "test string"
          expect(a).to eql "test string"
          expect(a).to be b
          expect(a).to equal b

          ...................................Comparison Matchers

          a = 1
          b = 2
          c = 3
          d = 'test string'

          # The following Expectations will all pass
          expect(b).to be > a
          expect(a).to be >= a
          expect(a).to be < b
          expect(b).to be <= b
          expect(c).to be_between(1,3).inclusive
          expect(b).to be_between(1,3).exclusive
          expect(d).to match /TEST/i

          ...............................Class/Type Matchers

          x = 1
          y = 3.14
          z = 'test string'

          # The following Expectations will all pass
          expect(x).to be_instance_of Fixnum
          expect(y).to be_kind_of Numeric
          expect(z).to respond_to(:length)

          ...............................True/False/Nil Matchers

          x = true
          y = false
          z = nil
          a = "test string"

          # The following Expectations will all pass
          expect(x).to be true
          expect(y).to be false
          expect(a).to be_truthy
          expect(z).to be_falsey
          expect(z).to be_nil

          ................................Error Matchers

          # The following Expectations will all pass
          expect { 1/0 }.to raise_error(ZeroDivisionError)
          expect { 1/0 }.to raise_error("divided by 0")
          expect { 1/0 }.to raise_error("divided by 0", ZeroDivisionError)

DOUBLES / MOCKS

          student1 = double('student')
          student2 = double('student')

STUBS

          allow(student1).to receive(:name) { 'John Smith'}
          allow(student2).to receive(:name) { 'Jill Smith'}

HOOKS
          before(:each) do
              puts "Runs before each Example"
          end

          after(:each) do
              puts "Runs after each Example"
          end

          before(:all) do
              puts "Runs before all Examples"
          end

          after(:all) do
              puts "Runs after all Examples"
          end

          it 'is the first Example in this spec file' do
              puts 'Running the first Example'
          end

          it 'is the second Example in this spec file' do
              puts 'Running the second Example'
          end

          \\output//

          Runs before all Examples
          Runs before each Example
          Running the first Example
          Runs after each Example
          .Runs before each Example
          Running the second Example
          Runs after each Example
          .Runs after all Examples

TESTS

          it 'is a slow test', :slow = > true do
              sleep 10
              puts 'This test is slow!'
          end

          it 'is a fast test', :fast = > true do
              puts 'This test is fast!'
          end

          //rspec --tag slow tag_spec.rb

SUBJECTS

          # describe Person do
          #   it 'create a new person with a first and last name' do
          #     person = Person.new 'John', 'Smith'

          #     expect(person).to have_attributes(first_name: 'John')
          #     expect(person).to have_attributes(last_name: 'Smith')
          #   end
          # end

          describe Person.new 'John', 'Smith' do
            it { is_expected.to have_attributes(first_name: 'John') }
            it { is_expected.to have_attributes(last_name: 'Smith') }
          end

HELPERS

          describe Dog do
            def create_and_walk_dog(good_or_bad)
              dog = Dog.new(good_or_bad)
              dog.walk_dog
              return dog
            end

            it 'should be able to create and walk a good dog' do
              dog = create_and_walk_dog(true)

              expect(dog.good_dog).to be true
              expect(dog.has_been_walked).to be true
            end

            it 'should be able to create and walk a bad dog' do
              dog = create_and_walk_dog(false)

              expect(dog.good_dog).to be false
              expect(dog.has_been_walked).to be true
            end
          end

METATAG

          RSpec.describe "An Example Group with a metadata variable", :foo => 17 do
            context 'and a context with another variable', :bar => 12 do

              it 'can access the metadata variable in the context block' do |example|
                  expect(example.metadata[:foo]).to eq(17)
                  expect(example.metadata[:bar]).to eq(12)
                  example.metadata.each do |k,v|
                  puts "#{k}: #{v}"
              end

            end
          end

FILTERING

          it 'can do normal numeric operations', positive: true do
            expect(1 + 1).to eq(2)
          end

          it 'generates an error when expected', negative: true do
            expect{1/0}.to raise_error(ZeroDivisionError)
          end

          //rspec --tag positive filter_spec.rb


CONTROLLER RSPEC

          get(:index) / get("/users/index") / get users_path

          expect(response).to render_template(template)
          expect(response).to redirect_to(path)
          expect(response).to have_http_status(status)
              200,  :ok
              403, :forbidden
              404, :not_found
              301, :moved_permanently
              302, :found
              500, :internal_server_error
              502, :bad_gateway
