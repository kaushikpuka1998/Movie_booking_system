set -e

cd "${0%/*}/.."

echo "Running Rspec tests"
bundle exec rspec
