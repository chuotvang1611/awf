---
description: Dùng lệnh này CUỐI phiên làm việc. AI sẽ tự động cập nhật các file tài liệu tổng quan (Architecture, Schema, API Doc) để không bị "quên" kiến thức (Context Drift).
---

# WORKFLOW: /save-brain - The Infinite Memory Keeper (Complete Documentation)

Bạn là **Antigravity Librarian**. Nhiệm vụ: Chống lại "Context Drift" - đảm bảo AI không bao giờ quên.

**Nguyên tắc:** "Code thay đổi → Docs thay đổi NGAY LẬP TỨC"

---

## Giai đoạn 1: Change Analysis

### 1.1. Hỏi User
*   "Hôm nay chúng ta đã thay đổi những gì quan trọng?"
*   Hoặc: "Để em tự quét các file vừa sửa?"

### 1.2. Tự động phân tích
*   Xem các file đã thay đổi trong session
*   Phân loại:
    *   **Major:** Thêm module, thay đổi DB → Update Architecture
    *   **Minor:** Sửa bug, refactor → Chỉ note log

---

## Giai đoạn 2: Documentation Update

### 2.1. System Architecture
*   File: `docs/architecture/system_overview.md`
*   Update nếu có:
    *   Module mới
    *   Third-party API mới
    *   Database changes

### 2.2. Database Schema
*   File: `docs/database/schema.md`
*   Update khi có:
    *   Bảng mới
    *   Cột mới
    *   Quan hệ mới

### 2.3. API Documentation (⚠️ Thường bị quên)

#### 2.3.1. Auto-generate API Docs
*   Scan tất cả API routes trong project
*   Tạo/update file `docs/api/endpoints.md`:

```markdown
# API Documentation

## Authentication
### POST /api/auth/login
- **Description:** Đăng nhập
- **Body:** { email, password }
- **Response:** { token, user }
- **Errors:** 401 (Wrong credentials)

## Users
### GET /api/users
- **Description:** Lấy danh sách users
- **Auth:** Required (Admin)
- **Query:** ?page=1&limit=10
- **Response:** { users[], total, page }
...
```

#### 2.3.2. OpenAPI/Swagger (Nếu cần)
*   Tạo file `docs/api/openapi.yaml` cho API consumers

### 2.4. Business Logic Documentation
*   File: `docs/business/rules.md`
*   Lưu lại các quy tắc nghiệp vụ:
    *   "Điểm thưởng hết hạn sau 1 năm"
    *   "Đơn hàng > 500k được free ship"
    *   "Admin có thể override giá"

### 2.5. Spec Status Update
*   Move Specs từ `Draft` → `Implemented`
*   Update nếu có thay đổi so với plan ban đầu

---

## Giai đoạn 3: Codebase Documentation

### 3.1. README Update
*   Cập nhật hướng dẫn setup nếu có dependencies mới
*   Cập nhật environment variables mới

### 3.2. Inline Documentation
*   Kiểm tra các function phức tạp có JSDoc chưa
*   Đề xuất thêm comments nếu thiếu

### 3.3. Changelog (⚠️ Quan trọng cho team)
*   Tạo/update `CHANGELOG.md`:

```markdown
# Changelog

## [2026-01-15]
### Added
- Tính năng tích điểm khách hàng
- API `/api/points/redeem`

### Changed
- Cập nhật giao diện Dashboard

### Fixed
- Lỗi không gửi được email xác nhận
```

---

## Giai đoạn 4: Knowledge Items Sync

### 4.1. Update KI nếu có kiến thức mới
*   Patterns mới được sử dụng
*   Gotchas/Bugs đã gặp và cách fix
*   Integration với third-party services

---

## Giai đoạn 5: Deployment Config Documentation

### 5.1. Environment Variables
*   Cập nhật `.env.example` với biến mới
*   Document ý nghĩa của từng biến

### 5.2. Infrastructure
*   Ghi lại cấu hình server/hosting
*   Ghi lại các scheduled tasks

---

## Giai đoạn 6: Confirmation

1.  Báo cáo: "Em đã cập nhật bộ nhớ. Các file đã update:"
    *   `docs/architecture/system_overview.md`
    *   `docs/api/endpoints.md`
    *   `CHANGELOG.md`
    *   ...
2.  "Giờ đây em đã ghi nhớ kiến thức này vĩnh viễn."
3.  "Anh có thể tắt máy yên tâm. Mai dùng `/recap` là em nhớ lại hết."

---

## ⚠️ BEST PRACTICES:
*   Chạy `/save-brain` sau mỗi tính năng lớn
*   Chạy `/save-brain` cuối mỗi ngày làm việc
*   Chạy `/save-brain` trước khi nghỉ phép dài
