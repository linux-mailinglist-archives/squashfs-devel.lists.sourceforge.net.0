Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46A52E347
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Hz-59; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYGG-0008RW-4r
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cyzBmAuy85hTG407fSwXszxBhDeY0JEI9Vsim/drlp0=; b=Fc/cAetfhsu4PYpvjbwSsD2QOx
 4qR7L8VfAAzoYkE7Eist9gCJKdedG1zHv1l79bCT3iUTSIDFEc7ZyreMf2BXPzLoyF3nKs9/0l3W9
 hVPq9MKA0ZQxYi4sb842mCRAvSue+P7TnG5BRxaPrvUNFBE2Ai6xo+iIDg2Vsg/oiPRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cyzBmAuy85hTG407fSwXszxBhDeY0JEI9Vsim/drlp0=; b=IwFR/bimlgWjtis0eXe+tt5GOA
 AhV2bRRncYehWDJGBUGUmEKYZXUtCiEM+PG6VJvoYjltcDAUBPbMjbt28JAuZhuL5We4tSSpQb+eg
 4URrB1NsyZtpjfrvTiHE+79fICe2Y1HMXyFEa0Oz7u3bOxkiU4vdsseJMTn3/NPV1ejA=;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYGF-0004Ed-LI
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:47:36 +0000
Received: by mail-vk1-f182.google.com with SMTP id q136so7272031vke.10
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cyzBmAuy85hTG407fSwXszxBhDeY0JEI9Vsim/drlp0=;
 b=fYHp5Ibgf6MU75g8M8dbc1iSHzvS5K4/hMPc3yTsfMlxDqqNFVmGAcoDLdOXY1uZhe
 kxXLoaC7sVNiyhGnqUUD2FPW4gu/Yr0Y4tvBzGtbxoBJiAr0NwSXfatjNeQaTMUYNbCF
 u9IV+SW0L+bO2nvFYGIzQla+Mqp+mz/O9Wa8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cyzBmAuy85hTG407fSwXszxBhDeY0JEI9Vsim/drlp0=;
 b=qkH9JXdI/e7ng33hzxc2E0M3pEHUU24PFapN+SHXdXCM5KJa2VbpjwrcJixQYCooU9
 EZenvvT6lS1F5LO4n31j2eVEUPBGhgGLu4vyNqzYqb0HMn1Ezr/+K8lwti8DjbvqXOgV
 RAZ+2nD9ay3KK2uFCtnZnxw2icDdkmohP3MFptkc4vReqgHH/A0mhYV5fpBU+0WKHjfY
 38WraDf4YPba1Ryt8TpqsZgrgaEcJ8WulmwUP4ftTn9Cs4cqXr8UA7VxMjJFvWoVeoxl
 kUgyBeGP0uibY/nUTdiebgdt7vMWbJB9dmDzDUGUutS49UCAI1uPquMJGNkSf87hgaMB
 BBfw==
X-Gm-Message-State: AOAM530GEAus8oGu+SThM6ugA8CQRb6xJiWTvS2BI7EI0hiRw5ZNR0/n
 4kTbh0mMacAxFN8BqK/whvcIc4/T9KnWtlAlvIi9dA==
X-Google-Smtp-Source: ABdhPJw30mOuCBmzAFwBccM5ilcLCgr57LGu0Vj+MV2y0pvq4kJocvrhJbs9ahsylTcg8yw7LbLYezAiyeApW8mi718=
X-Received: by 2002:a05:6122:da8:b0:331:3b30:8b40 with SMTP id
 bc40-20020a0561220da800b003313b308b40mr5718489vkb.30.1652698048140; Mon, 16
 May 2022 03:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220516104209.1407388-1-hsinyi@chromium.org>
In-Reply-To: <20220516104209.1407388-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 18:47:02 +0800
Message-ID: <CAJMQK-gT6H1BM0i+tLM1ORuf+Tz+GNSJUJdKZOjPYzVJX84u1A@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>, 
 Xiongwei Song <Xiongwei.Song@windriver.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16,
 2022 at 6:42 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > Commit c1f6925e1091("mm: put readahead pages in cache earlier")
 requires > fs to implement readahead callback. Otherwise t [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.182 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.182 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYGF-0004Ed-LI
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH 0/3] Implement readahead for squashfs
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 16, 2022 at 6:42 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Commit c1f6925e1091("mm: put readahead pages in cache earlier") requires
> fs to implement readahead callback. Otherwise there will be a
> performance regression.
>
> Commit 9eec1d897139("squashfs: provide backing_dev_info in order to
> disable read-ahead") mitigates the performance drop issue for squashfs
> by closing readahead for it.
>
> This series implements readahead callback for squashfs. The previous
> discussion are in [1] and [2].
>
> [1] https://lore.kernel.org/all/CAJMQK-g9G6KQmH-V=BRGX0swZji9Wxe_2c7ht-MMAapdFy2pXw@mail.gmail.com/T/
> [2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m4af4473b94f98a4996cb11756b633a07e5e059d1
>
> Hsin-Yi Wang (3):
>   Revert "squashfs: Convert squashfs to read_folio"
>   Revert "squashfs: provide backing_dev_info in order to disable
>     read-ahead"
>   squashfs: implement readahead
>
>  fs/squashfs/file.c    | 82 +++++++++++++++++++++++++++++++++++++++++--
>  fs/squashfs/super.c   | 33 -----------------
>  fs/squashfs/symlink.c |  5 ++-
>  3 files changed, 81 insertions(+), 39 deletions(-)
>
> --
> 2.36.0.550.gb090851708-goog
>

hi, please ignore this for now. I'll resend a correct cover letter.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
