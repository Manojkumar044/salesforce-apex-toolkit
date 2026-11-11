# Salesforce Apex Toolkit

A practical, community-driven collection of reusable Salesforce Apex patterns, testing utilities, integration examples, and Lightning Web Component building blocks.

The goal is to help Salesforce developers write code that is bulk-safe, testable, secure, maintainable, and easy to understand.

## Project status

This is an early-stage starter project. The initial Account trigger sample demonstrates a thin trigger delegating logic to a handler. Review and test every example in a Salesforce org before production use.

## Included

- Bulk-oriented Account trigger and handler example
- Unit tests, including a 200-record scenario
- Salesforce DX project structure
- Contribution, security, and community guidelines
- GitHub issue and pull request templates

## Quick start

Prerequisites: Salesforce CLI (`sf`) and a Salesforce Developer Edition org, Trailhead Playground, or sandbox.

```bash
git clone https://github.com/Manojkumar044/salesforce-apex-toolkit.git
cd salesforce-apex-toolkit
sf org login web --alias dev --set-default
sf project deploy start --source-dir force-app --target-org dev
sf apex run test --tests AccountTriggerHandlerTest --result-format human --target-org dev
```

## Current example: Account trigger handler

Before insert, the handler copies Billing Address fields to Shipping Address fields only when Shipping Street is blank. It handles a list of records in one transaction and preserves a populated shipping address. This is an illustrative business rule, not a universal requirement; adapt it to your org.

## Roadmap

| Module | Planned contents |
|---|---|
| Trigger framework | Trigger context routing, handler conventions, recursion strategy |
| Test data factory | Reusable test records and test setup patterns |
| Governor limits | Bulkification examples and limit-aware design |
| Integration toolkit | HTTP callouts, Named Credentials guidance, mocks |
| Security toolkit | CRUD, FLS, sharing and user-mode examples |
| LWC utilities | Reusable Lightning Web Components and Jest tests |
| Revenue Cloud examples | Documented Revenue Cloud patterns where licensing and org access permit |

Roadmap items are proposals until implemented and tested. Open an issue before starting a major feature.

## Quality principles

1. Bulk-safe by default; no SOQL or DML in loops.
2. Explicit sharing and data-access decisions.
3. Positive, negative, and bulk tests.
4. No secrets, tokens, credentials, or customer data in source control.
5. Document org/API prerequisites and limitations.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md), check existing issues, and open an issue to discuss substantial changes.

## Security

Please report suspected vulnerabilities privately. See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).

## Disclaimer

Independent community project; not affiliated with or endorsed by Salesforce, Inc. Salesforce marks are trademarks of Salesforce, Inc.
