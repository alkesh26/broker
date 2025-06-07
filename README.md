# Broker

A message broker built with Ruby on Rails, designed for reliable message queuing and delivery.

## Features

- Message queuing and delivery
- RESTful API endpoints
- PostgreSQL database backend
- Modern UI with Tailwind CSS

## Prerequisites

- Ruby 3.2.0 or higher
- PostgreSQL 12 or higher
- Node.js 16 or higher (for asset compilation)

## Setup Instructions

### Local Development Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd broker
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. Seed data:
    ```bash
    rails db:seed
    ```

5. Start the development server:
   ```bash
   ./bin/dev
   ```

The application will be available at `http://localhost:3000`

## Development

### Running Tests

```bash
bundle exec rspec
```

### Code Style

This project uses RuboCop for code style enforcement. To check your code:

```bash
bundle exec rubocop
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

