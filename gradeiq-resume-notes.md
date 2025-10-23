# GradeIQ Resume Notes

## Project Overview

-   **Live URL**: https://gradeiq.netlify.app
-   **GitHub**: Frontend at `/home/viktor/projects/GradeIQ`, Backend at `/home/viktor/projects/backend/GradeIQ`
-   **Development Period**: October 2025 (First commit: Oct 8, 2025; Last commit: Oct 23, 2025)
-   **Type**: AI-powered grading platform for automated assessment of student submissions

## Tech Stack

### Frontend

-   Next.js 15.5.4 with React 19.1.0
-   TanStack Query (React Query) for data fetching and caching
-   TanStack Table for table management
-   React Hook Form + Zod for form validation
-   shadcn/ui + Radix UI (dialogs, popovers, dropdowns, tabs, collapsibles, etc.)
-   Tailwind CSS 4
-   react-pdf + pdfjs-dist for PDF viewing
-   react-dropzone for file uploads
-   next-themes for dark mode
-   Sonner for toast notifications
-   date-fns for date formatting
-   Lucide React + react-icons for icons

### Backend

-   FastAPI (Python web framework)
-   Supabase (database, auth, storage)
-   Pydantic for data validation
-   Multiple AI providers:
    -   Anthropic (Claude Sonnet 4.5, Claude Opus 4.1)
    -   Google (Gemini 2.5 Pro, Gemini 2.5 Flash)
-   ThreadPoolExecutor for concurrent processing (max 3 workers)
-   python-dotenv for environment management
-   Uvicorn as ASGI server

## Backend Features

### Core API Functionality

-   RESTful API with FastAPI
-   JWT-based authentication with Supabase Auth
-   Role-based access control (user roles in database)
-   CORS configuration for production (Netlify) and local development
-   Custom Pydantic validation with field-level error messages
-   Exception handling with detailed error responses

### Assignment Management

-   CRUD operations for assignments (create, read, update, delete)
-   Assignment fields: title, description, due date, max grade, passing grade
-   Mark scheme storage with rubrics
-   PDF mark scheme upload and storage
-   Authorization checks (assigned_to field)

### Submission Management

-   Bulk PDF upload (base64 encoded)
-   Individual submission viewing
-   Batch operations:
    -   Bulk deletion with detailed results
    -   Bulk grade confirmation
-   Submission fields: student_name, grade, feedback, grade_confirmed, grading_status
-   Signed URL generation with 2-hour expiration for secure downloads
-   Update operations (grade, student_name, grade_confirmed)

### AI Grading System

-   **Multi-provider support**: Claude Sonnet, Claude Opus, Gemini Pro, Gemini Flash
-   **Mark scheme auto-generation**: Upload PDF → AI extracts questions, rubrics, model answers
-   **Automated grading**: AI grades submissions against rubrics
-   **Background task processing**: FastAPI BackgroundTasks for async batch grading
-   **Grading status tracking**: idle/pending/completed/failed states
-   **Status polling endpoint**: Check progress of batch grading jobs
-   **Structured AI output**: Pydantic schemas validate AI responses to JSON
-   **Evidence-based grading**: AI quotes specific submission text as justification
-   **Criterion-by-criterion evaluation**: Individual feedback per rubric item
-   **Multiple question types**: MCQ, short answer, open-ended with rubrics
-   **Precise vs. rubric-based modes**: Exact answer matching or rubric evaluation
-   **Mathematical notation recognition**: AsciiMath, LaTeX, handwritten
-   **Multi-part question handling**: Questions like 1a, 1b, 1c
-   **Partial credit**: AI awards partial marks based on rubrics

### AI Response Structure (Pydantic Models)

```python
# Mark Scheme Generation
class Rubric(BaseModel):
    criterion: str
    marks: float

class MarkScheme(BaseModel):
    answer: Optional[str]
    number: str
    question: Optional[str]
    options: Optional[list[Option]]
    rubrics: Optional[list[Rubric]]
    precise_answer: Optional[bool]

class Assignment(BaseModel):
    title: str
    description: str
    mark_scheme: list[MarkScheme]
    max_grade: float

# Grading Output
class CriterionFeedback(BaseModel):
    criterion: str
    max_marks: float
    awarded_marks: float
    feedback: str
    evidence: str  # Quote from submission

class QuestionGrade(BaseModel):
    number: str
    question_text: str
    total_marks: float
    awarded_marks: float
    criteria_feedback: list[CriterionFeedback]
    overall_comment: str

class SubmissionGrade(BaseModel):
    total_possible_marks: float
    total_awarded_marks: float
    overall_feedback: str
    question_grades: list[QuestionGrade]
    strengths: list[str]
    areas_for_improvement: list[str]
```

### API Endpoints Summary

-   `GET /`: Welcome message
-   `GET /users/me`: Get current user profile
-   `POST /users/login`: User authentication
-   `GET /assignments`: List all assignments for user
-   `POST /assignments`: Create new assignment
-   `PUT /assignments/{id}`: Update assignment
-   `DELETE /assignments/{id}`: Delete assignment
-   `GET /assignments/{id}/submissions`: List submissions for assignment
-   `POST /assignments/{id}/submissions/upload`: Bulk upload submissions
-   `POST /assignments/{id}/submissions/grade`: Start batch grading in background
-   `GET /assignments/{id}/submissions/status`: Check grading progress
-   `POST /assignments/{id}/submissions/confirm-grades`: Batch confirm AI grades
-   `DELETE /assignments/{id}/submissions`: Batch delete submissions
-   `PUT /submissions/{id}`: Update individual submission
-   `GET /submissions/{id}/file`: Get signed URL for submission PDF
-   `POST /rubrics/generate`: AI-generate mark scheme from PDF
-   `GET /models`: List supported AI models and providers

## Frontend Features

### UI Components & Libraries

-   **shadcn/ui + Radix UI**: Dialogs, dropdowns, popovers, tabs, collapsibles, navigation menus, scroll areas, progress bars
-   **Custom components**:
    -   SelectModel: AI provider/model selector with icons
    -   Checkbox: Custom checkbox component
    -   CheckX: Pass/fail visual indicator
    -   ErrorMessage: Error display component
    -   BlockLoader, LoadingButton: Loading states

### Forms & Validation

-   **React Hook Form** for form state management
-   **Dynamic field arrays**: Add/remove questions, rubrics, MCQ options
-   **Zod schemas** for validation (via @hookform/resolvers)
-   **Custom validation messages**: Field-level error display
-   **DateTime picker** for assignment due dates
-   **Drag-and-drop file uploads** using react-dropzone

### Data Management

-   **TanStack Query** (React Query):
    -   Optimistic updates
    -   Real-time status polling for grading progress
    -   Automatic refetching on window focus
    -   Cache management
    -   Query devtools integration
-   **Custom hooks**:
    -   useAssignments
    -   useSubmissions
    -   useModels
    -   useGenerate
    -   useAssignmentMutation
    -   useSubmissionMutation
    -   useDownloadSubmission
    -   useUser

### Tables & Data Display

-   **TanStack Table** for submission lists
-   **Bulk checkbox selection** with select-all functionality
-   **Sortable columns**
-   **Custom cell renderers**: Grade display, pass/fail indicators, edit controls
-   **Row selection state management**
-   **Filtering by grading status** (excludes pending items from selection)

### PDF Handling

-   **react-pdf** integration for in-browser PDF viewing
-   **pdfjs-dist** with web worker
-   **PDF.js worker** copied to public folder via postinstall script
-   View submissions and mark schemes directly in browser

### Assignment Workflow

1. **Create Assignment**:
    - Option 1: Manual creation with form
    - Option 2: Upload PDF → AI generates mark scheme → Review/edit → Create
    - Set title, description, due date, max grade, passing grade
    - Define mark scheme with questions, rubrics, model answers
2. **Upload Submissions**: Bulk PDF upload via drag-and-drop
3. **Grade Submissions**:
    - Select AI provider and model
    - Batch grade with background processing
    - Real-time status updates (pending/completed/failed)
4. **Review Grades**:
    - View detailed feedback per submission
    - See criterion-by-criterion breakdown
    - View quoted evidence from student work
    - See strengths and areas for improvement
5. **Manual Override**: Edit grades and student names
6. **Confirm Grades**: Batch confirmation workflow

### UI/UX Features

-   **Dark mode support** via next-themes
-   **Responsive design**: Mobile and desktop layouts
-   **Toast notifications** (Sonner) for user feedback
-   **Loading states**: Skeleton loaders, animated messages during AI processing
-   **Error handling**: User-friendly error messages
-   **Status indicators**: Visual grading status (idle/pending/completed/failed)
-   **Passing grade indicators**: Visual pass/fail markers based on threshold
-   **Progress tracking**: Real-time grading progress for batch operations

### Pages Structure

-   `/`: Landing page
-   `/login`: Authentication
-   `/app`: Dashboard/assignments list
-   `/app/assignments/[id]`: Assignment detail with submissions table

## Technical Highlights

### Security

-   JWT authentication with Supabase
-   Row-level security model (service key on backend, user JWT on frontend)
-   Authorization checks on all protected endpoints
-   CORS whitelist for allowed origins
-   No service keys exposed on frontend

### Performance

-   Server-side rendering with Next.js 15
-   TanStack Query caching and optimistic updates
-   Background task processing for expensive AI operations
-   Concurrent processing with ThreadPoolExecutor (3 workers)
-   PDF.js web workers for non-blocking PDF rendering
-   Turbopack for faster Next.js builds

### Code Quality

-   Type safety with Pydantic on backend
-   Structured error handling with custom exception handlers
-   Validation at multiple levels (frontend forms, backend Pydantic)
-   Modular architecture (separate AI handlers, services, components)
-   Custom hooks for reusable logic
-   Environment-based configuration (.env files)

### AI Integration

-   Multi-provider architecture supporting multiple LLMs
-   Provider abstraction layer (request_ai function)
-   Model selection exposed to users via UI
-   Structured prompting for consistent outputs
-   Pydantic validation of AI responses
-   Fallback handling for failed AI requests

## Current Resume Entry (Latest Version)

## Alternative Angles to Emphasize

### Full-Stack Focus

-   Emphasize end-to-end implementation
-   Highlight API design and frontend integration
-   Mention type safety across stack (Pydantic + Zod)

### AI/LLM Focus

-   Multi-provider LLM integration
-   Structured output validation
-   Prompt engineering for grading consistency
-   Evidence-based AI justifications

### Architecture Focus

-   Background task processing
-   Real-time status polling
-   Batch operations with error handling
-   Multi-provider abstraction layer

### UI/UX Focus

-   Dynamic forms with field arrays
-   Bulk selection and operations
-   Real-time feedback and status updates
-   In-browser PDF viewing

## File Statistics

-   **Backend**: ~574 lines in main.py + AI modules
-   **Frontend**: ~105 JS/JSX files
-   **Components**: 40+ React components organized by feature
-   **Custom Hooks**: 8 custom hooks for data fetching/mutations

## Notes

-   Project is a prototype (stated in backend README)
-   Uses service role key on backend to bypass RLS (mentioned in code comments)
-   CORS configured for both local dev and production Netlify deployment
-   PDF.js worker automatically copied to public folder via npm postinstall script
-   Uses Next.js 15 with Turbopack for builds
-   TanStack Query devtools enabled in development
