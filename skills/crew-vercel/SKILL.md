---
name: crew-vercel
description: "Create, publish, and organize Open Dream product websites through Codex Sites, Framer, GitHub, and Vercel. Use when setting up or releasing the Open Dream Ops hub, Crew, FRNKLYONE, ADAM, or future product websites; using the CREW Vercel team; planning product paths under opndrm.com; or preparing a later secure commerce backend."
---

# Crew Vercel

Use this single skill for approved Open Dream web releases. Keep the product architecture coherent: Open Dream Ops is the parent brand, while Crew, FRNKLYONE, and ADAM are products. Vercel is the normal public-hosting layer; Framer remains valid only for a site whose content, CMS, and publishing are actually Framer-owned.

Use one repeatable path for every product:

`desktop product repository → Codex Sites build and preview → GitHub source repository → Vercel project in Crew 21 → product path on opndrm.com`

Vercel hosts a **project**, not a source repository. Keep each product's source in its own GitHub repository, then connect that repository to the matching Vercel project.

## Product architecture

- Parent hub: `opndrm.com`
- Crew: `opndrm.com/crew`
- FRNKLYONE: `opndrm.com/frnklyone`
- ADAM: `opndrm.com/adam`

Treat `/crew`, `/frnklyone`, and `/adam` as product paths, not Vercel account names or login paths. Use the Vercel team named **CREW**; its current unique Vercel slug is **crew21**. The slug is an internal Vercel address label, not the public company or product name.

## Current web setup: AI-agnostic source map

Use this map to locate the correct source before editing. These are separate
products and surfaces; do not merge them, create duplicate repositories, or
infer a repository connection from a Vercel project name.

| Surface | Local source and editing boundary | Vercel / public reference | Important constraint |
| --- | --- | --- | --- |
| **ADAM landing page** | `/Users/uoa/Desktop/ADAM/ADAM_APP/website` | Project: `adam`; fallback: `https://adam-phi-puce.vercel.app/` | The site is inside the ADAM app checkout, not a separate site checkout. |
| **FRNKLYONE landing page** | `/Users/uoa/Desktop/FRNKLY-RUST/website` | Project: `frnkly-one`; intended custom domain: `frankly.one` | Treat the domain attachment and DNS state as unverified until checked live. |
| **Crew native application** | `/Users/uoa/Desktop/crew` | Not the public web source | JCode exclusively owns Crew code and pipeline execution. |
| **Detailed Crew Overview** | Source candidate: `/Users/uoa/Documents/Codex/2026-08-03/realtime-voice-chat-9/work/crew-overview-parallel-card` | Published page is the **“Parallel work, made legible”** Crew Overview | This is a candidate until its source is compared with the live deployment. |
| **Open Dream Ops hub** | Local source must be recovered before edits | Separate Vercel project: `opndrm`; serves the public hub routes | Do not edit or redeploy based on a guessed local folder. |

Vercel projects, GitHub source repositories, and domain/DNS ownership are
three distinct things. A Vercel project can exist without a Git connection;
**Connect Git Repository** means only that automatic Git deployments are not
configured. It does not mean the website source is absent. Verify the local
checkout, its remote when relevant, the Vercel project, and the domain state
independently before changing any of them.

For ADAM, confine web edits to its `website/` directory and only change root
Vercel configuration when required. Do not mistake native app directories for
website files or move the website out of the app checkout without explicit
owner authorization.

## Publish workflow

1. Start with the selected product's desktop repository. Verify the repository and product name before changing anything. Never deploy an earlier preview or an unverified duplicate.
2. Build the product website in Codex Sites. Keep the product's public site separate from its native application or agent runtime.
3. Preview and validate the site. Report build failures plainly; do not present a local preview as deployed.
4. Create or reuse one GitHub repository for that product's website source. Keep Crew, FRNKLYONE, ADAM, and future products in separate repositories unless the user explicitly chooses a monorepo.
5. Use the Vercel connector to confirm the CREW team and inspect existing projects.
6. Create or deploy the product as its own Vercel project after the user explicitly asks to publish. Start with a production deploy only when the user has clearly authorized public release.
7. Open the deployment and verify the product page loads.
8. Attach the public domain only after the deployment is healthy and the user authorizes the domain change.

### Account connection and registrar handoff

The repeatable connection process is AI-agnostic, but the human owner performs
sign-in, two-factor approval, account selection, and any password-manager
interaction. An AI may inspect the resulting authorized state and carry out
only the scoped actions the owner approves.

1. The owner signs in to Vercel with the account that owns the **CREW** team,
   confirms the desired team, and approves the relevant GitHub/Codex
   connection. Never ask an AI to reveal, copy, or store a password, passkey,
   or authenticator code.
2. Verify that the Vercel team and intended GitHub repository are visible;
   create or reuse the matching product project only after explicit release
   approval.
3. Let Vercel complete a healthy deployment first. A queued deployment is not
   a completed release and must not be represented as live.
4. In Vercel, attach the intended custom domain to the healthy project. Record
   Vercel's exact DNS requirement before editing a registrar.
5. The owner signs in to the registrar (for example Namecheap) and opens the
   domain's DNS screen. Preserve mail, SPF, DKIM, and unrelated records.
6. Add or change only the exact Vercel-issued host record, save once, then
   wait for Vercel domain verification. Do not delete or replace a record
   merely because it is unfamiliar.
7. Verify the public address after DNS is confirmed. Keep the Vercel fallback
   address recorded until the custom domain is healthy.

For `frankly.one`, inspect the live registrar zone and Vercel's exact required
record before making a change. Preserve any mail, SPF, DKIM, and unrelated
records that are present. Do not assume a prior apex record, domain attachment,
or verification result is still current. ADAM's custom-domain status must also
be verified live before it is described as current.

For the first product launch, publish a stable version and retain the deployment URL as a fallback. Do not delete a working source merely because a newer build exists; remove only the user-designated published copy, preferably through a recoverable Trash action.

## Choose the publishing surface

Do not treat Framer, Codex Sites, and Vercel as interchangeable. Identify the owner of the exact website before publication.

### Framer-owned site

Use this only when the pages and CMS are maintained in Framer.

1. Confirm the exact Framer project, its current editor state, public destination, and approved change.
2. When a Crew Codex Sites page was recreated in Framer, use `crew-shot` and `crew-visual-compare` at the same viewport before release. Resolve recorded fidelity gaps and obtain approval for intentional differences.
3. Publish with Framer's native operation and verify the public page.

### Codex Sites–built site going to Vercel

Use when the public site is built with Codex Sites but must be hosted on Vercel.

1. Confirm the exact source project, successful build, and GitHub repository. A local preview is not a deployment.
2. Verify that the build output and runtime are Vercel-compatible before creating a Vercel project. If the source targets another hosting runtime, have the approved execution owner create the compatible Vercel configuration rather than deploying a broken substitute.
3. Deploy the validated source to the matching Vercel project, then verify the generated public Vercel address.
4. Leave the domain unchanged until the healthy deployment is confirmed and the exact domain-routing plan is approved.

## Release safeguards

- Do not publish merely because a build succeeds or a request says to get it ready; require explicit publication approval. A public release needs an identified source, destination, and access level.
- Do not switch between Framer and Codex Sites without the user's direction.
- Report a live result only after the hosting platform confirms a successful deployment.
- If a deployment fails, report the visible failure and stop. Do not loop through speculative repairs or publish a substitute.

## Root-domain routing

`opndrm.com/crew` requires a root Open Dream Ops site that owns the domain and routes product paths. Do not connect `opndrm.com` directly to a standalone Crew project if the plan includes multiple products.

Implement the root hub and route each product under its approved path. Configure each product for its path prefix so its navigation, assets, and links work from that address. Treat a product subdomain as a preview convenience only unless the user changes the public architecture.

Before changing DNS, nameservers, custom-domain assignment, redirects, or rewrites, state the exact effect and obtain approval. Vercel deployment access does not establish ownership of the external domain registrar or authorize DNS changes.

## Mac-app landing pages

For a small native-app product page, use a deliberately smaller surface than the Crew Console: no login, sparse centered typography, generous whitespace, a tiny hoverable icon treatment, and one clear Mac download action. Do not invent a download URL or imply that a binary exists; when a signed artifact is not available, label the button honestly as availability or download coming soon.

- **ADAM:** warm off-white or light-gray canvas; quiet, family-oriented but neutral copy.
- **FRNKLYONE:** charcoal-gray canvas with restrained light type; neutral federal-information product language.

Both pages should share the Open Dream white/black Swiss-brutalist discipline while remaining visibly distinct from Crew’s richer diagnostic interface.

## Website and execution boundaries

- For Crew implementation work, send an explicitly authorized, bounded request to the verified live JCode session. Do not write Crew application code, run No Mistakes, or publish Crew Map updates yourself.
- Keep the public website separate from Crew's native JCode control plane. It is a product and presentation surface, not a replacement runtime.
- Use product names exactly: Open Dream Ops is the parent; Crew, FRNKLYONE, and ADAM are distinct products.
- Treat financial features as a later, separate phase. Use a vetted payment provider, server-side secrets, and explicit approval before creating accounts, accepting terms, saving payment details, or enabling live charges.

## What to report

Report only the useful state: selected product, build result, deployment status, public URL, domain-routing state, and the smallest remaining decision. Keep Vercel team identifiers, credentials, internal deployment IDs, and raw logs out of user-facing updates.
