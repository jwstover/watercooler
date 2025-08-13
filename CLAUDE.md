# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Watercooler is a Phoenix LiveView application with AI chat functionality built using Ash Framework. The application provides user authentication via magic links and real-time chat with AI agents.

## Architecture

### Core Technologies
- **Phoenix LiveView**: Real-time UI with server-rendered templates
- **Ash Framework**: Resource-based architecture for data modeling and business logic
- **Ash Domains**: `Watercooler.Chat` and `Watercooler.Accounts`
- **AshAuthentication**: Magic link authentication system
- **Oban**: Background job processing for AI responses
- **AshAI**: AI integration for chat responses
- **PostgreSQL**: Primary database via `ash_postgres`

### Key Components
- **Chat Domain** (`lib/watercooler/chat.ex`): Manages conversations and messages
- **Accounts Domain** (`lib/watercooler/accounts.ex`): User management and authentication
- **LiveViews**: `ChatLive` for chat interface, `HomeLive.Index` for home page
- **Background Jobs**: AI response generation via Oban queues (`chat_responses`, `conversations`)

### Authentication Flow
- Magic link authentication via AshAuthentication
- Routes protected by `ash_authentication_live_session`
- User context loaded via `LiveUserAuth` on_mount hooks

## Common Development Commands

### Setup and Dependencies
```bash
mix setup                    # Install deps, setup DB, build assets
mix deps.get                # Install dependencies only
mix ash.setup               # Setup Ash resources and database
```

### Development Server
```bash
mix phx.server              # Start Phoenix server
iex -S mix phx.server       # Start server with IEx console
```

### Database Operations
```bash
mix ash.migrate             # Run Ash migrations
mix ash.reset               # Reset database
mix ecto.setup              # Standard Ecto setup
mix ecto.reset              # Reset Ecto database
```

### Asset Management
```bash
mix assets.setup            # Install Tailwind and esbuild
mix assets.build            # Build CSS and JS assets
mix assets.deploy           # Build and minify for production
```

### Testing
```bash
mix test                    # Run all tests (includes ash.setup --quiet)
```

## Development Tools (Available in Dev)

### Admin Interfaces
- **AshAdmin**: `/admin` - Ash resource administration
- **LiveDashboard**: `/dev/dashboard` - Phoenix metrics and debugging
- **Oban Dashboard**: `/oban` - Background job monitoring
- **Swoosh Mailbox**: `/dev/mailbox` - Email preview

### Key File Locations
- **Router**: `lib/watercooler_web/router.ex`
- **LiveViews**: `lib/watercooler_web/live/`
- **Ash Resources**: `lib/watercooler/chat/` and `lib/watercooler/accounts/`
- **Migrations**: `priv/repo/migrations/`
- **Seeds**: `priv/repo/seeds.exs`

## Ash Framework Patterns

### Resource Definition
Resources are defined in their respective domain folders with:
- Actions (create, read, update, delete)
- Attributes and relationships
- Changes and validations
- Policies for authorization

### Background Jobs
AI responses are handled asynchronously via AshOban:
- Messages trigger response generation
- Conversations can be auto-named
- Jobs processed in dedicated queues

### Code Interface
Domains expose functions via `define` macros:
- `Watercooler.Chat.create_message/1`
- `Watercooler.Chat.message_history/2`
- `Watercooler.Chat.my_conversations/1`

## Usage Rules Reference

The project includes usage-rules for Ash ecosystem libraries in `AGENTS.md`. These provide specific guidance for:
- ash, ash_postgres, ash_authentication
- ash_phoenix, ash_ai, ash_oban
- igniter (code generation tool)